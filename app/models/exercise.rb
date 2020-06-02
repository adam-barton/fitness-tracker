class Exercise < ApplicationRecord

    belongs_to :workout

    validates :name, presence: true
    validates :reps_goal, presence: true
    validates :reps_goal, numericality: { only_integer: true }

    def self.search(term)
        where("name ILIKE ?", "%#{term}%")
      end

end
