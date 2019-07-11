class ProfilesController < ApplicationController
    before_action :get_user

    def index
    end

    def show
    end

    def destroy
        @user.delete
        session[:user_id] = nil
        redirect_to users_path
    end

end
