require "test_helper"

class PhoneNumbersTest < ActionDispatch::IntegrationTest

  test "phone_number Index Only shows logged in users list of phone_number" do
        user = login_user
        phone_number1 = FactoryBot.create :phone_number, user: user
        phone_number2 = FactoryBot.create :phone_number, user: user
        phone_number3 = FactoryBot.create :phone_number
    
        visit phone_numbers_path
    
        assert_text phone_number1.phone_number
        assert_text phone_number2.phone_number
        refute page.has_content?(phone_number3.phone_number)
        #Passes test
end

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