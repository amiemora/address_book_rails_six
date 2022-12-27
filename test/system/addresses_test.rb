require "application_system_test_case"

class AddressesTest < ApplicationSystemTestCase

    test "visit index" do 
        login_user
        visit addresses_path
        assert_selector "h4", text: "Address Table"
        #Passes test
    end 
end 