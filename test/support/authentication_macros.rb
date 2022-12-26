module AuthenticationMacros
    # this is for testing if the user can logout
    def login_user(user_properties = {})
      user = FactoryBot.create :user, user_properties
      visit login_path
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_button "Login"
  
      user
    end
    # Resets before each test
    def reset_login
      reset_session!
    end
  end