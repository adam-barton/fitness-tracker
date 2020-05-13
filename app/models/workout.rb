class Workout < ApplicationRecord

    belongs_to :user
    has_many :exercises
    
    validates :name, presence: true
    validates :duration, presence: true
end
