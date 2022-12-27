require "application_system_test_case"

class EmailsTest < ApplicationSystemTestCase

    test "visit index" do 
        login_user
        visit emails_path
        assert_selector "h4", text: "Email Table"
        #Passes test
    end 
end 