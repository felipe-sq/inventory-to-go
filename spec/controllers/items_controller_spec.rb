require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  let!(:item1) { FactoryGirl.create(:item, department: department1) }
  let(:result) { JSON.parse(response.body) }
  let(:department1) { FactoryGirl.create(:department) }

  describe 'GET #index' do
    let!(:item_from_other_dept) {FactoryGirl.create(:item) }
    before do
      get :index, department_id: department1.id, item_id: item1.id
    end

    it 'responds succesfully' do
      expect(response).to have_http_status(:success)
    end

    it 'returns valid json' do
      expect { JSON.parse(response.body) }.to_not raise_error
    end

    it 'should return a list' do
      expect(result).to be_an(Array)
    end

    it 'includes all item attributes' do
      item_1_result = result.detect { |x| x['id'] == item1.id }
      expect(item_1_result['name']).to eq(item1.name)
      expect(item_1_result['description']).to eq(item1.description)
      expect(item_1_result['amount']).to eq(item1.amount)
      expect(item_1_result['reviewed']).to eq(item1.reviewed)
    end

    it 'only returns items from the specified department' do
      item_1_result = result.detect { |x| x['id'] == item1.id }
      expect(item_1_result).to be_present
      expect(item_1_result).not_to include(item_from_other_dept)
    end
  end

  describe 'GET #create' do
    it 'returns http success' do
      get :create, department_id: department1.id
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
