require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #index' do
    it 'should render the users index page' do
      get :index, {}
      expect(response).to render_template('index')
    end
  end  

  describe 'GET #new' do
    it 'should render the new user page' do
      get :new, {}
      expect(response).to render_template('new')
    end
  end

  describe 'POST #create' do
    it 'should redirect the user to the main goal app page' do
      post :create, params: {user: {username: 'test@test.com', password: 'testing'}}
      expect(response).to redirect_to users_url
    end
  end
end


