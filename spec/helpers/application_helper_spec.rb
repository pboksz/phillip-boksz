require 'rails_helper'

describe ApplicationHelper do
  let(:star_full) { "<i class=\"fas fa-star\"></i>" }
  let(:star_empty) { "<i class=\"far fa-star\"></i>" }
  let(:star_half) { "<i class=\"fas fa-star-half-alt\"></i>" }
  let(:question) { "<i class=\"fas fa-question-circle\"></i>" }

  describe '#icon_link' do
    describe "no options" do
      subject { helper.icon_link('/link', 'fas', 'star') }
      it { expect(subject).to eq "<a href=\"/link\">#{star_full}</a>" }
    end

    describe 'blank option' do
      subject { helper.icon_link('/link', 'fas', 'star', blank: true) }
      it { expect(subject).to eq "<a target=\"_blank\" href=\"/link\">#{star_full}</a>" }
    end
  end

  describe '#star_rating_tag' do
    subject { helper.star_rating_tag(stars) }

    describe '0 stars' do
      let(:stars) { 0 }
      it { expect(subject).to eq question }
    end

    describe '0.5 stars' do
      let(:stars) { 0.5 }
      it { expect(subject).to eq "#{star_half}#{star_empty * 4}" }
    end

    describe '1 stars' do
      let(:stars) { 1 }
      it { expect(subject).to eq "#{star_full}#{star_empty * 4}" }
    end

    describe '1.5 stars' do
      let(:stars) { 1.5 }
      it { expect(subject).to eq "#{star_full}#{star_half}#{star_empty * 3}" }
    end

    describe '2 stars' do
      let(:stars) { 2 }
      it { expect(subject).to eq "#{star_full * 2}#{star_empty * 3}" }
    end

    describe '2.5 stars' do
      let(:stars) { 2.5 }
      it { expect(subject).to eq "#{star_full * 2}#{star_half}#{star_empty * 2}" }
    end

    describe '3 stars' do
      let(:stars) { 3 }
      it { expect(subject).to eq "#{star_full * 3}#{star_empty * 2}" }
    end

    describe '3.5 stars' do
      let(:stars) { 3.5 }
      it { expect(subject).to eq "#{star_full * 3}#{star_half}#{star_empty * 1}" }
    end

    describe '4 stars' do
      let(:stars) { 4 }
      it { expect(subject).to eq "#{star_full * 4}#{star_empty}" }
    end

    describe '4.5 stars' do
      let(:stars) { 4.5 }
      it { expect(subject).to eq "#{star_full * 4}#{star_half}" }
    end

    describe '5 stars' do
      let(:stars) { 5 }
      it { expect(subject).to eq "#{star_full * 5}" }
    end
  end

  describe '#switch_project_tag' do
    let(:project) { nil }
    let(:type) { nil }
    subject { helper.switch_project_tag(project, type) }

    describe 'no project link or type' do
      it { expect(subject).to be_nil }
    end

    describe 'has project link and type' do
      let(:project) { 'project' }

      describe 'next' do
        let(:type) { :next }
        it { expect(subject).to include 'a class="next" href="#project"' }
        it { expect(subject).to include 'i class="fas fa-caret-down"' }
      end

      describe 'previous' do
        let(:type) { :prev }
        it { expect(subject).to include 'a class="prev" href="#project"' }
        it { expect(subject).to include 'i class="fas fa-caret-up"' }
      end
    end
  end
end
