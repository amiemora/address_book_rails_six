class PhoneNumber < ApplicationRecord
  belongs_to :person

  belongs_to :user
end
