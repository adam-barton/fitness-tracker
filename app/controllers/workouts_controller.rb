class WorkoutsController < ApplicationController
    before_action :current_user

    def index
        @workouts = Workout.all
    end
    def show
        @workout = Workout.find_by(id: params[:id])
    end

    def new
        @user = @current_user
        @workout = Workout.new
    end

    def create
        @workout = Workout.new(workout_params)
        @workout.user = @current_user
        if @workout.save
         redirect_to root_path
        else
            render new_workout_path
        end
        
    end

    def edit
        @workout = Workout.find_by(id: params[:id])
    end

    def update
        @workout = Workout.find_by(id: params[:id])
        @workout.update(workout_params)
        redirect_to root_path
    end

    private

    def workout_params
        params.require(:workout).permit(:name, :duration, :user_id,
            exercise_attributes: [:name, :reps_goal])
    end
end
