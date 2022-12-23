class SessionsController < ApplicationController
    def new
    end
    def create
      # Only one user with this one email
      @user = User.where(email: params[:email]).first
      if @user && @user.authenticate(params[:password])
        login(@user)
        redirect_to root_path, notice: "Logged in"
      else
        redirect_to login_path, alert: "Invalid email or password."
      end
    end
  
    def destroy
      logout
      redirect_to root_path, notice: "Logged out"
    end
  end