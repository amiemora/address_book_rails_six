require "test_helper"

class PhoneNumberTest < ActiveSupport::TestCase
  test "has a valid factory" do
    phone_number = FactoryBot.build :phone_number

    assert phone_number.valid?
    #Passes test
  end

  test "requires a user" do
    phone_number = FactoryBot.build :phone_number
    phone_number.user = nil

    refute phone_number.valid?
    #Passes test
  end
end
