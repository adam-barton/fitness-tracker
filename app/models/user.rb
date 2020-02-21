class User < ApplicationRecord

    has_many :workouts

    validates :name, presence: true
    validates :email, presence: true
    validates :email, uniqueness: true, message: "This email already has an account."
    validates :password_digest, length:{ minimum: 10 }
    validates :password_digest, format: { with: /\A(?=[^\d_].*?\d)\w(\w|[!@#$%]){7,20}/, message: "Your password must contain at least 1 upper case character, at least 1 lower case character, at least 1 numerical character, and at least 1 special character"}

  
    has_secure_password

end
