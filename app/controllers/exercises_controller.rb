class ExercisesController < ApplicationController

    def new
        @exercise = Exercise.new(:workout_id => params[:workout_id])
    end
    
    def create
        @exercise = Exercise.new(exercise_params)
        if @exercise.save!
            redirect_to workout_path(@exercise.workout)
        else
            @exercise.errors
        end
    end


    private

    def exercise_params
        params.require(:exercise).permit(:name, :muscle_group, :description, :reps_goal, :workout_id)
      end
end
