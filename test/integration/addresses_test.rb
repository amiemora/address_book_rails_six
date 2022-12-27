require "test_helper"

class AddressesTest < ActionDispatch::IntegrationTest
    test "address Index Only shows logged in users list of address" do
        user = login_user
        address1 = FactoryBot.create :address, user: user
        address2 = FactoryBot.create :address, user: user
        address3 = FactoryBot.create :address
    
        visit addresses_path
    
        assert_text address1.street
        assert_text address2.street
        refute page.has_content?(address3.street)
        #Passes test
    end

    test "Create Address" do
        login_user
        visit addresses_path

        click_on "New Address"
        visit new_address_path

        fill_in "address_street", with: "street"
        fill_in "address_town", with: "town"
        fill_in "address_zip", with: "zip"
        click_button "Create Address"
        #Passes test
    end



end