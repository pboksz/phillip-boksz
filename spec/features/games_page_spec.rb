require 'rails_helper'

describe 'Games page' do
  before { visit games_path }

  it 'shows games' do
    expect(page).to have_text I18n.t('games.title')
    GAMES.each do |game|
      expect(page).to have_link '', href: game.link
      expect(page).to have_text game.name
    end
  end
end
