require "application_system_test_case"

class PhoneNumbersTest < ApplicationSystemTestCase

    test "visit index" do 
        login_user
        visit phone_numbers_path
        assert_selector "h4", text: "Phone Table"
        #Passes test
    end 


end 