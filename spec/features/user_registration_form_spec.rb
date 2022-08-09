require 'rails_helper'

describe "User Registration Form" do
  it 'creates a new user' do
    visit root_path

    click_on "Register as a User"

    expect(current_path).to eq new_users_path

    username = 'funbucket13'
    password = 'test'

    fill_in :username, with: username
    fill_in :password, with: password

    click_on 'Create User'

    expect(page).to have_content("Welcome, #{username}!")
  end
end
