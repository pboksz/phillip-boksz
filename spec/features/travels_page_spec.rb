require 'rails_helper'

describe 'Travels page' do
  before { visit travels_path }

  it 'shows map' do
    expect(page).to have_text I18n.t('travels.title')
    expect(page).to have_selector '#travel-map'
  end
end
