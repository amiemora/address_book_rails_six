require "test_helper"

class SitesTest < ActionDispatch::IntegrationTest

    test "the truth" do
       assert true 
    end

  # This test works
  test "home page works" do
    visit root_path
    assert_selector "h4", text: "Must be Logged into your account to view your Address Book Details Above."
  end
  #Passes test

  # NOW lets test it NOT working
  # I will test the Index Page of the Addresses for something I know isnt there just be check
  # test "Home Page not working" do
  #   visit root_path
  #   assert_selector "h1", text: "Wrong"
  # end
  # Fails
end