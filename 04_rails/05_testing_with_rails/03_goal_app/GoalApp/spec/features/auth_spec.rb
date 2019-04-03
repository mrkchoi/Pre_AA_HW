require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  scenario 'has a new user page' do 
    visit new_user_url
    expect(page).to have_content('Sign up')
  end
end

feature 'signing up a user' do
    before(:each) do 
      visit new_user_url
      fill_in 'Username', with: 'testing@test.com'
      fill_in 'Password', with: 'testing'
      click_on 'Register'
    end

  scenario 'shows username on the hompeage after signup' do
      expect(page).to have_content 'testing@test.com'
  end
end

feature 'logging in' do
  before(:each) do 
    visit new_user_url
    fill_in 'Username', with: 'testing@test.com'
    fill_in 'Password', with: 'testing'
    click_on 'Register'

    visit new_session_url
    fill_in 'Username', with: 'testing@test.com'
    fill_in 'Password', with: 'testing'
    click_button('new_session_btn')
  end

  scenario 'shows username on the homepage after login' do
    expect(page).to have_content 'testing@test.com'
  end

end

feature 'logging out' do
  before(:each) do 
    visit new_user_url
    fill_in 'Username', with: 'testing@test.com'
    fill_in 'Password', with: 'testing'
    click_on 'Register'

    visit new_session_url
    fill_in 'Username', with: 'testing@test.com'
    fill_in 'Password', with: 'testing'
    click_button('new_session_btn')
  end
  scenario 'begins with a logged in state' do
    expect(page).to have_content 'testing@test.com'
  end

  scenario 'doesn\'t show username on the homepage after logout' do
    click_button('Logout')
    expect(page).not_to have_content 'testing@test.com'
  end
end