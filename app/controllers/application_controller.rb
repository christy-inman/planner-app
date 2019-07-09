class ApplicationController < ActionController::Base
    before_action :authenticate_user, except: [:index, :login, :login_attempt, :new]
    before_action :save_login_state, only: [:login, :login_attempt]
  
    def authenticate_user
        if session[:user_id]
            @current_user = User.find(session[:user_id])
            return true
        else
            redirect_to users_path
        end
    end

    def save_login_state
        if session[:user_id]
            redirect_to show_profile_path
            return false
        else
            return true
        end
    end

end
