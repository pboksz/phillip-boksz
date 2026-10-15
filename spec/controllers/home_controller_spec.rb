require 'rails_helper'

describe HomeController do
  describe 'GET #index' do
    before { get :index }

    it 'renders', :aggregate_failures do
      expect(assigns(:title)).to eq I18n.t('travels.title')
      expect(response).to render_template :travels
    end
  end

  describe 'GET #projects' do
    before { get :projects }
    it { expect(response).to render_template :projects }
  end

  describe 'GET #games' do
    before { get :games }

    it 'renders', :aggregate_failures do
      expect(assigns(:title)).to eq I18n.t('games.title')
      expect(response).to render_template :games
    end
  end

  describe 'GET #travels' do
    before { get :travels }

    it 'renders', :aggregate_failures do
      expect(assigns(:title)).to eq I18n.t('travels.title')
      expect(response).to render_template :travels
    end
  end

  describe 'GET #sitemap' do
    before { get :sitemap, format: 'xml' }
    it { expect(response).to render_template :sitemap, layout: false }
  end
end
