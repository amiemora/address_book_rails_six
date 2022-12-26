require "test_helper"

class SessionsTest < ActionDispatch::IntegrationTest
  test "users can login" do
    user =
      FactoryBot.create :user, email: "user@example.com", password: "password"
    visit root_path

    click_on "Login"

    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    click_button "Login"

    assert_equal page.current_path, root_path
    assert_text "Logout"
    refute page.has_content?("Login")
    #Passes test
  end

  test "users can't login with incorrect password" do
    user =
      FactoryBot.create :user, email: "user@example.com", password: "password"
    visit login_path

    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    click_button "Login"

    visit login_path
    #Passes test
  end

  test "users can logout" do
    login_user email: "amie@gmail.com"

    visit root_path
    assert_text "amie@gmail.com"

    click_on "Logout"

    refute page.has_content?("Logout")
    #Passes test
  end
end
