class SessionsController < ApplicationController
  before_action :authenticate_user, except: [:index, :login, :login_attempt, :new]
  before_action :save_login_state, only: [:login, :login_attempt]  

  def login
  end

  def login_attempt
    @auth_user = User.authenticate( params[:username], params[:password] )
    if @auth_user.valid?
      session[:user_id] = @auth_user.id
      flash[:notice] = "Let's get planning, #{@auth_user.username}!"
      redirect_to show_profile_path
    else
      @error = "Invalid Login"
      redirect_to sessions_login_path
    end
  end

  def destroy
    session.delete :user_id
    redirect_to sessions_login_path
  end

end