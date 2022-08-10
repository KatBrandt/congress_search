require 'rails_helper'

describe "Logging In" do
  it 'can log inwith valid credentials' do
    user = User.create!(username: 'funbucket', password: 'test')
    visit root_path

    click_on "Sign In"

    expect(current_path).to eq login_path

    fill_in :username, with: user.username
    fill_in :password, with: user.password

    click_on "Log In"

    expect(current_path).to eq root_path
    expect(page).to have_content("Welcome, #{user.username}!")
  end
end
