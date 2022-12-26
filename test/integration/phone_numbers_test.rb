require "test_helper"

class PhoneNumbersTest < ActionDispatch::IntegrationTest
  test "Create Phone Number" do
    login_user
    visit phone_numbers_path

    click_on "New Phone Number"
    visit new_phone_number_path

    fill_in "phone_number_phone_number", with: "number"
    click_button "Create Phone number"
    #Passes test
  end
end