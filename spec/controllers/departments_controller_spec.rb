require 'rails_helper'

RSpec.describe DepartmentsController, type: :controller do
  let(:result) { JSON.parse(response.body) }
  describe 'index' do
    before { get :index }
    it 'should return a list' do
      expect(result).to be_a(Array)

    end

    it 'include department attributes'

    it 'respond succesfully' do
      expect(response).to have_http_status(200)

    end
  end


  describe 'create'

  describe 'show'

  describe 'update'

  describe 'destroy'

end
