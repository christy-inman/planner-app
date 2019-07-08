class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(allowed_params)
    if @user.save
      flash[:notice] = "Success! You created a new profile."
      # redirect_to show_profile_path
    else
      flash[:notice] = "Invalid entry."
    end
    render :new
  end

  private

  def allowed_params
    params.require(:user).permit(:username, :password_digest)
  end

end
