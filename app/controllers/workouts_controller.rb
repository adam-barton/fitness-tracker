class WorkoutsController < ApplicationController
    before_action :current_user

    def index
        @workouts = Workout.all
    end
    def show
        @workout = Workout.find_by(id: params[:id])
        @exercises = @workout.exercises.all.sort
        respond_to do |f|
            f.html {render :show}
            f.json {render json: @workout, include: ['exercises']}
        end
    end

    def new
        @user = @current_user
        @workout = Workout.new
    end

    def create
        @workout = Workout.new(workout_params)
        @workout.user = @current_user
        @workout.set_times
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
        @workout.set_times
        @workout.time_diff
        redirect_to root_path
    end

    def destroy
        @workout = Workout.find_by(id: params[:id])
        if @workout.user == @current_user
            @workout.destroy
            redirect_to root_path
        else
            flash[:message] = "That workout isn't yours to delete"
            redirect_to current_user
        end
    end

    private

    def workout_params
        params.require(:workout).permit(:name, :duration, :user_id,
            exercise_attributes: [:name, :reps_goal])
    end
end
