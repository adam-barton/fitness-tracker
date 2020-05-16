class Workout < ApplicationRecord

    belongs_to :user
    has_many :exercises
    
    validates :name, presence: true
    validates :duration, presence: true

    after_find :check_times

    def set_start_time
       self.countdown_starting_time = Time.now
    end

    def set_end_time
       self.countdown_ending_time = Time.now.advance(:days => + self.duration.to_i)
    end

    def set_times
        self.countdown_starting_time = set_start_time
        self.countdown_ending_time = set_end_time
    end

    def time_diff
        TimeDifference.between(Time.now, self.countdown_ending_time).humanize
    end

    def check_times
        if time_diff.to_i < 0
            set_times
            time_diff
        else
            time_diff
        end
    end


end

