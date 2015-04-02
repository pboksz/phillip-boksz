require 'rails_helper'

describe 'Home page' do
  before do
    page.driver.block_unknown_urls
    visit root_path
  end

  it 'has proper links' do
    expect(page).to have_link '', href: projects_path
    expect(page).to have_link '', href: games_path
    expect(page).to have_link '', href: travels_path
    expect(page).to have_link '', href: I18n.t('header.github_url')
    expect(page).to have_link '', href: I18n.t('header.linkedin_url')
    expect(page).to have_link '', href: "mailto:#{I18n.t('header.email')}"
  end

  it 'shows map' do
    expect(page).to have_text I18n.t('header.name')
    expect(page).to have_text I18n.t('travels.title')
    expect(page).to have_selector('#travel-map')
  end
end
