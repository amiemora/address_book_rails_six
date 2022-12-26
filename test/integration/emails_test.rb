require "test_helper"

class EmailsTest < ActionDispatch::IntegrationTest
  test "email Index Only shows logged in users list of email" do
    user = login_user
    email1 = FactoryBot.create :email, user: user
    email2 = FactoryBot.create :email, user: user
    email3 = FactoryBot.create :email

    visit emails_path

    assert_text email1.email_address
    assert_text email2.email_address
    refute page.has_content?(email3.email_address)
    #Passes test
end

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
