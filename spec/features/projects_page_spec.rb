require 'rails_helper'

describe 'Projects page' do
  before { visit projects_path }

  it 'shows projects' do
    PROJECTS.each do |project|
      expect(page).to have_text project.name
      expect(page).to have_link '', href: project.link
      expect(page).to have_selector "##{project.anchor}"
      expect(page).to have_text project.tech.join(' | ')
    end
  end
end
