class ApplicationController < ActionController::Base

    def get_user
        if session[:user_id]
            @user = User.find(session[:user_id])
        else
            redirect_to users_path
        end
    end

    def save_login_state
        if session[:user_id]
            redirect_to profiles_path
        end
    end

end
