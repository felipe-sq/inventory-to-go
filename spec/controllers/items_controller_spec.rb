require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  let!(:item1) { FactoryGirl.create(:item) }
  let(:result) { JSON.parse(response.body) }

  describe 'GET #index' do
    before { get :index }

    it 'responds succesfully' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #create' do
    it 'returns http success' do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #update' do
    it 'returns http success' do
      get :update
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #destroy' do
    it 'returns http success' do
      get :destroy
      expect(response).to have_http_status(:success)
    end
  end
end
