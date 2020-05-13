class Exercise < ApplicationRecord

    belongs_to :workout

    validates :name, presence: true
    validates :reps_goal, presence: true
    validates :reps_goal, numericality: { only_integer: true }

end
