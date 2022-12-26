require "test_helper"

class PeopleTest < ActionDispatch::IntegrationTest
  test "People Index Only shows logged in users list of People" do
    user = login_user
    person1 = FactoryBot.create :person, user: user
    person2 = FactoryBot.create :person, user: user
    person3 = FactoryBot.create :person

    visit people_path

    assert_text person1.first_name
    assert_text person2.first_name
    refute page.has_content?(person3.first_name)
    #Passes test
  end

  test "Create a new person" do
    login_user
    visit people_path

    click_on "New Person"
    visit new_person_path
    # Had to inspect the page to see the real name of the field
    # It wansn't "First Name" but rather "person_first_name"
    fill_in "person_first_name", with: "new person"
    fill_in "person_last_name", with: "new person"
    click_button "Create Person"
    #Passes test
  end
end