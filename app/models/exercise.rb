class Exercise < ApplicationRecord

    belongs_to :workout

    validates :name, presence: true
    validates :goal, presence: true
    validates :goal, numericality: { only_integer: true }

end
