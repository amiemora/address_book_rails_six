require "test_helper"

class EmailTest < ActiveSupport::TestCase
  test "has a valid factory" do
    email = FactoryBot.build :email

    assert email.valid?
    #Passes test
  end

  test "requires a user" do
    email = FactoryBot.build :email
    email.user = nil

    refute email.valid?
    #Passes test
  end

end
