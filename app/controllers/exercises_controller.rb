class ExercisesController < ApplicationController


    def show
        exercise = Exercise.find_by(id: params[:id])
        render json: exercise
    end

    def new
        @exercise = Exercise.new(:workout_id => params[:workout_id])
    end

    def autocomplete
        @exercises = Exercise.search(params[:term])
        # @exercises = Exercise.all
        render json: @exercises.map(&:name).uniq 
    end
    
    def create
        @exercise = Exercise.new(exercise_params)
        if @exercise.save!
            redirect_to root_path
        else
            @exercise.errors
        end
    end

    def edit
        @exercise = Exercise.find_by(id: params[:id])
    end

    def update
        exercise = Exercise.find_by(id: params[:id])
        exercise.update(exercise_params)
        exercise.save

        respond_to do |format|
            format.html { redirect_to root_path }
            format.json { render json: exercise }
          end
    end

    private

    def exercise_params
        params.require(:exercise).permit(:name, :muscle_group, :description, :reps_goal, :reps_completed, :workout_id)
      end
end
