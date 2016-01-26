require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  let!(:item1) { FactoryGirl.create(:item, department: department1) }
  let(:result) { JSON.parse(response.body) }
  let(:department1) { FactoryGirl.create(:department) }

  describe 'GET #index' do
    let!(:item_from_other_dept) { FactoryGirl.create(:item) }
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

    it 'includes all item attributes for the index action' do
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
    before do
      @new_item = build(:item)
      post :create, department_id: department1.id, item: { name: @new_item.name, description: @new_item.description, amount: @new_item.amount }
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns valid json' do
      expect { JSON.parse(response.body) }.to_not raise_error
    end

    it 'creates an item with the correct attributes' do
      hashed_json = JSON.parse(response.body)
      expect(hashed_json['name']).to eq(@new_item.name)
      expect(hashed_json['description']).to eq(@new_item.description)
      expect(hashed_json['amount']).to eq(@new_item.amount)
      expect(hashed_json['reviewed']).to eq(@new_item.reviewed)
    end
  end

  describe 'PUT #update' do
    before do
      put :update, department_id: department1.id, id: item1.id, item: { name: item1.name, description: item1.description, amount: item1.amount, reviewed: item1.reviewed }
    end

    it 'returns http success' do
      expect(response).to have_http_status(200)
    end

    it 'returns valid json' do
      expect { result }.to_not raise_error
    end

    it 'updates a department with the correct attributes' do
      hashed_json = JSON.parse(response.body)
      expect(item1.name).to eq hashed_json['name']
      expect(item1.description).to eq hashed_json['description']
      expect(item1.amount).to eq hashed_json['amount']
      expect(item1.reviewed).to eq hashed_json['reviewed']
    end
  end

  describe 'PUT #destroy' do
    it 'returns http success' do
      get :destroy
      expect(response).to have_http_status(:success)
    end
  end
end
