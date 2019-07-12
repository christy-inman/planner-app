class List < ApplicationRecord
    has_many :tasks
    # belongs_to :profile
    validates :title, presence: true, uniqueness: true
end
