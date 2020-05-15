class ExercisesController < ApplicationController


    def show
        exercise = Exercise.find_by(id: params[:id])
        render json: exercise
    end

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

    def update
        exercise = Exercise.find_by(id: params[:id])
        exercise.update(exercise_params)
        exercise.save

        render json: exercise
    end

    private

    def exercise_params
        params.require(:exercise).permit(:name, :muscle_group, :description, :reps_goal, :reps_completed, :workout_id)
      end
end
