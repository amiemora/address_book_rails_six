class UsersController < ApplicationController
  before_action :authenticate, except: %i[new create]
  before_action :set_user, only: %i[ show ]

 

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end



  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      redirect_to root_path, notice: "You successfully signed up!"
    else
      render :new, status: :unprocessable_entity
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
