class ExercisesController < ApplicationController

    def new
        @exercise = Exercise.new
    end
    
    def create
        @exercise = Exercise.new(exercise_params)

        if @exercise.save!
            redirect_to exercises_path
        else
            @exercise.errors
        end
    end


    private

    def exercise_params
        params.require(:exercise).permit(:name, :muscle_group, :description, :reps_goal)
      end
end
