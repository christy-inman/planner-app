class SessionsController < ApplicationController
  before_action :get_user, except: [:index, :login, :login_attempt, :new]
  before_action :save_login_state, only: [:login, :login_attempt]  

  def login
    @user = User.new
    render :login
  end

  def login_attempt
    @user = User.find_by(username: params[:user][:username].downcase)
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      flash[:notice] = "Let's get planning, #{@user.username}!"
      redirect_to profiles_path
    else
      flash.now.alert = "Invalid Login"
      render :login
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to sessions_login_path, notice: "Logged out!"
  end

end
