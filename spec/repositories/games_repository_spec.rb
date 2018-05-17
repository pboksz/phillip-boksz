require 'rails_helper'

describe GamesRepository do
  describe '#all' do
    before { expect(subject).to receive(:parsed_games) }
    it { subject.all }
  end

  describe '#write_to_yaml' do
    describe 'present' do
      let(:games) { [{ "name" => "Board Game" }] }
      before do
        expect(subject).to receive(:parsed_games).twice.and_return(games)
        expect(File).to receive(:write).with("#{Rails.root}/config/games.yml", games.to_yaml)
      end

      it { subject.write_to_yaml }
    end

    describe 'blank' do
      let(:games) { [] }
      before do
        expect(subject).to receive(:parsed_games).and_return(games)
        expect(File).to receive(:write).never
      end

      it { subject.write_to_yaml }
    end
  end

  describe '#response' do
    before { expect(Net::HTTP).to receive(:get).with(URI.parse(GamesRepository::BGG_COLLECTION_URL)) }
    it { subject.send(:response) }
  end

  describe '#bgg_games' do
    let(:items) { { "item" => ["name" => "Board Game"] } }
    before { expect(subject).to receive(:response).and_return(items.to_xml(root: "items")) }

    it { expect(subject.send(:bgg_games)).to eq items["item"] }
  end

  describe '#parsed_games' do
    before { expect(subject).to receive(:bgg_games).and_return(items) }

    describe 'data present' do
      let(:items) { [{ "objectid"=> "1", "name" => "Board Game", "yearpublished" => "2000", "stats" => { "rating" => { "value" => "7" } } }] }
      let(:attributes) { { "link" => "#{GamesRepository::BGG_GAME_URL}1", "name" => "Board Game (2000)", "stars" => 3.5 } }

      it { expect(subject.send(:parsed_games).first).to eq attributes }
    end

    describe 'data not present' do
      let(:items) { [{ "success" => "failed" }] }
      it { expect(subject.send(:parsed_games).first).to be_nil }
    end
  end
end
