FactoryBot.define do


    factory :user do |f|
      f.sequence(:email) { |n| "test#{n}@account.com" }
      f.password { "password" }
      f.password_confirmation { |d| d.password }
    end
    #create a new user that owns this person
    factory :person do |f|
      f.sequence(:first_name) { |n| "Person#{n}" }
      f.sequence(:last_name) { |n| "Person#{n}" }
      f.association :user
    end
  
    factory :address do |f|
      f.sequence(:street) { |n| "Address#{n}" }
      f.sequence(:zip) { |n| "Address#{n}" }
      f.sequence(:town) { |n| "Address#{n}" }
      f.association :user
      f.association :person
    end
  
    factory :email do |f|
      f.sequence(:email_address) { |n| "Email#{n}" }
      f.association :user
      f.association :person
    end
  
    factory :phone_number do |f|
      f.sequence(:phone_number) { |n| "Phone#{n}" }
      f.association :user
      f.association :person
    end


   
  
  end
  
  #allows us to use the model User in order to simulate an existing user