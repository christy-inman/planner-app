class User < ApplicationRecord
    has_secure_password
    validates :username, presence: true, uniqueness: true, length: { minimum: 3 } 
    validates :password, presence: true, confirmation: true, length: { minimum: 3 }
    has_one :profile
end
