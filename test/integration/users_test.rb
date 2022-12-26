require "test_helper"

class UsersTest < ActionDispatch::IntegrationTest
  # This test reads through the steps that a user would take in order to sign up
  test "users can sign up" do
    visit root_path

    click_on "Sign Up"

    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "testpassword"
    fill_in "Password confirmation", with: "testpassword"

    click_button "Create User"

    assert_equal page.current_path, root_path

    assert_text "Logout"
    refute page.has_content?("Login")
    #Passes test
  end

  test "users cant signup with an error" do
    visit signup_path

    click_on "Sign Up"

    fill_in "Email", with: "testexample.com" #no @ in email
    fill_in "Password", with: "testpassword"
    fill_in "Password confirmation", with: "testpassword"

    click_button "Create User"
    #Passes test
  end
end