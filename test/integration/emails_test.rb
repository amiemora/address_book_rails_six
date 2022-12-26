require "test_helper"

class EmailsTest < ActionDispatch::IntegrationTest
  test "Create Email" do
    login_user
    visit emails_path

    click_on "New Email"
    visit new_email_path

    fill_in "email_email_address", with: "email"
    click_button "Create Email"
    #Passes test
  end
end
