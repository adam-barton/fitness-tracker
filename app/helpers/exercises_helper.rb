module ExercisesHelper

    def goal_remaining(exercise)
        exercise.reps_goal - exercise.reps_completed
    end
end
