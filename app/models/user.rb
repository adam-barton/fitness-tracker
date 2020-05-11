class User < ApplicationRecord

    has_many :workouts

    validates :name, presence: true
    validates :email, presence: true
    validates :email, uniqueness: true 
    validates :password, presence: true
    validates :password, length:{ minimum: 10 }
    validates :password, format: { with: /(?=.{10,})(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*\W).*/, message: "Your password must contain at least 1 upper case character, at least 1 lower case character, at least 1 numerical character, and at least 1 special character"}

  
    has_secure_password

    before_create { generate_token(:auth_token) }

    def generate_token(column)
        begin
            self[column] = SecureRandom.urlsafe_base64
        end while User.exists?(column => self[column])
      end

end
