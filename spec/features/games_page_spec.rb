require 'rails_helper'

describe 'Games page' do
  before do
    page.driver.block_unknown_urls
    visit games_path
  end

  it 'shows games' do
    expect(page).to have_text I18n.t('games.title')
    GAMES.each do |game|
      expect(page).to have_text game.name
      expect(page).to have_text game.expansions.join(' ')
      expect(page).to have_text game.description
    end
  end
end
