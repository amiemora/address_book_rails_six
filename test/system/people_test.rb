require "application_system_test_case"

class PeopleTest < ApplicationSystemTestCase

    test "visit index" do 
        login_user
        visit people_path
        assert_selector "h4", text: "Person Table"
        #Passes test
    end 
end 