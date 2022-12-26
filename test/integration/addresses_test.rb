require "test_helper"

class AddressesTest < ActionDispatch::IntegrationTest
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