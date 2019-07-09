class User < ApplicationRecord
    require 'bcrypt'
    attr_accessor :username, :password_digest 
    has_secure_password
    validates :username, presence: true, uniqueness: true, length: { minimum: 3 } 
    validates :password_digest, presence: true, confirmation: true, length: { in: 6..18 }

    def self.authenticate( login_username, login_password )
        @user = User.find_by(login_username.downcase)
        if @user.present? && @user.match_password
            return user
        else 
            return false
        end
    end

    def match_password( login_password = "" )
        @user.password_digest == login_password
    end
end
