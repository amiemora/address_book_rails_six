require "test_helper"

class PersonTest < ActiveSupport::TestCase
  test "has a valid factory" do
    person = FactoryBot.build :person

    assert person.valid?
    #Passes test
  end

  test "requires a user" do
    person = FactoryBot.build :person
    person.user = nil

    refute person.valid?
    #Passes test
  end


end
