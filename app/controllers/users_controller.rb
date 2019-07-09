class UsersController < ApplicationController
  before_action :save_login_state, only: [:login, :login_attempt]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Success! You created a new profile."
      redirect_to user_path
    else
      @error = "Invalid entry."
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end

end
