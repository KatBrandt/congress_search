require 'rails_helper'

describe "Admin Login" do
  describe 'Successful Login' do
    it 'logs in as admin and directs to admin dashboard' do
      admin = User.create!(username: "superuser", password: "test", role: 2)

      visit login_path

      fill_in :username, with: admin.username
      fill_in :password, with: admin.password

      click_on "Log In"

      expect(current_path).to eq admin_dashboard_path
    end
  end
end
