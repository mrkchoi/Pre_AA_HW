require 'spec_helper'
require 'rails_helper'

feature 'creating a goal' do
  before(:each) do 
    # Create account
    visit new_session_url
    fill_in 'Username', with: 'testing@test.com'
    fill_in 'Password', with: 'testing'
    click_on 'Register'

    # Navigate to profile
    save_and_open_page

    # 
  end

  scenario ''
end

feature 'viewing a goal' do
end

feature 'editing a goal' do
end

feature 'deleting a goal' do
end

