require 'rails_helper'

describe HomeController do
  describe 'GET #index' do
    before { get :index }
    it { expect(response).to render_template :travels }
  end

  describe 'GET #projects' do
    before { get :projects }
    it { expect(response).to render_template :projects }
  end

  describe 'GET #games' do
    before { get :games }
    it { expect(response).to render_template :games }
  end

  describe 'GET #travels' do
    before { get :travels }
    it { expect(assigns(:title)).to eq I18n.t('travels.title') }
    it { expect(response).to render_template :travels }
  end
end
