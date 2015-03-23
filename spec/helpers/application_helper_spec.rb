require 'rails_helper'

describe ApplicationHelper do
  def icons(type, times = 1)
    "<i class=\"fa fa-#{type}\"></i>" * times
  end

  describe '#star_rating_tag' do
    subject { helper.star_rating_tag(stars) }

    describe '0 stars' do
      let(:stars) { 0 }
      it { expect(subject).to eq icons('star-o', 5) }
    end

    describe '0.5 stars' do
      let(:stars) { 0.5 }
      it { expect(subject).to eq icons('star-half-o') + icons('star-o', 4) }
    end

    describe '1 stars' do
      let(:stars) { 1 }
      it { expect(subject).to eq icons('star') + icons('star-o', 4) }
    end

    describe '1.5 stars' do
      let(:stars) { 1.5 }
      it { expect(subject).to eq icons('star') + icons('star-half-o') + icons('star-o', 3) }
    end

    describe '2 stars' do
      let(:stars) { 2 }
      it { expect(subject).to eq icons('star', 2) + icons('star-o', 3) }
    end

    describe '2.5 stars' do
      let(:stars) { 2.5 }
      it { expect(subject).to eq icons('star', 2) + icons('star-half-o') + icons('star-o', 2) }
    end

    describe '3 stars' do
      let(:stars) { 3 }
      it { expect(subject).to eq icons('star', 3) + icons('star-o', 2) }
    end

    describe '3.5 stars' do
      let(:stars) { 3.5 }
      it { expect(subject).to eq icons('star', 3) + icons('star-half-o') + icons('star-o', 1) }
    end

    describe '4 stars' do
      let(:stars) { 4 }
      it { expect(subject).to eq icons('star', 4) + icons('star-o', 1) }
    end

    describe '4.5 stars' do
      let(:stars) { 4.5 }
      it { expect(subject).to eq icons('star', 4) + icons('star-half-o') }
    end

    describe '5 stars' do
      let(:stars) { 5 }
      it { expect(subject).to eq icons('star', 5) }
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
        it { expect(subject).to include 'i class="fa fa-caret-down"' }
      end

      describe 'previous' do
        let(:type) { :prev }
        it { expect(subject).to include 'a class="prev" href="#project"' }
        it { expect(subject).to include 'i class="fa fa-caret-up"' }
      end
    end
  end
end
