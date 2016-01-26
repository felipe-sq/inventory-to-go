require 'rails_helper'

RSpec.describe DepartmentsController, type: :controller do
  let!(:department_1) { FactoryGirl.create(:department) }
  let(:result) { JSON.parse(response.body) }

  describe 'index' do
    before { get :index }

    it 'returns valid json' do
      expect { JSON.parse(response.body) }.to_not raise_error
    end

    it 'should return a list' do
      expect(result).to be_an(Array)
    end

    it 'includes department name and id' do
      dept1 = result.detect { |x| x['id'] == department_1.id }
      expect(dept1['name']).to eq(department_1.name)
      expect(dept1['description']).to eq(department_1.description)
    end

    it 'respond succesfully' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST create' do
    before do
      @new_department = build(:department)
      post :create, department: { name: @new_department.name, description: @new_department.description }
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns valid json' do
      expect { JSON.parse(response.body) }.to_not raise_error
    end

    it 'creates a department with the correct attributes' do
      hashed_json = JSON.parse(response.body)
      expect(hashed_json['name']).to eq(@new_department.name)
      expect(hashed_json['description']).to eq(@new_department.description)
    end
  end

  describe 'GET show' do
    before { get :show, id: department_1.id }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns valid json' do
      expect { result }.to_not raise_error
    end

    it 'returns department_1 serialized' do
      expect(JSON.parse(response.body)).to eq result
    end
  end

  describe 'PUT update' do
    before do
      @new_department = build(:department)
      put :update, id: department_1.id, department: { name: @new_department.name, description: @new_department.description }
    end

    it 'returns http success' do
      expect(response).to have_http_status(200)
    end

    it 'returns valid json' do
      expect { result }.to_not raise_error
    end

    it 'updates a department with the correct attributes' do
      expect(@new_department.name).to eq result['name']
    end
  end

  describe 'DELETE destroy' do
    let(:delete_dept) { delete :destroy, id: department_1.id }
    let!(:dept_2) { FactoryGirl.create(:department) }

    it 'returns no content' do
      delete_dept
      expect(response).to have_http_status(:success)
    end

    it 'deletes department' do
      expect { delete_dept }.to change { Department.count }.by(-1)
    end

    it 'leaves other departments alone' do
      delete_dept
      expect(dept_2.reload).to_not be_nil
    end
  end
end
