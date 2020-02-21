class User < ApplicationRecord

    has_many :workouts

    validates :name, presence: true
    validates :email, presence: true
    validates :email, uniqueness: true
  
    has_secure_password

end
