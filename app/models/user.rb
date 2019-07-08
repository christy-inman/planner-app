class User < ApplicationRecord
    attr_accessor :password_digest 
    has_secure_password
    validates :username, presence: true, uniqueness: true, length: { minimum: 3 } 
    validates :password_digest, presence: true, confirmation: true, length: { in: 6..18 }
end
