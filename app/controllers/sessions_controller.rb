class SessionsController < ApplicationController
    # skip_before_action :current_user, only: [:create]
    skip_before_action :redirect_if_not_logged_in, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
      @user = User.find_by(email: params[:user][:email])
        if @user && @user.authenticate(params[:user][:password])

            session[:user_id] = @user.id

            redirect_to @user
        else
            flash[:message] = "Your email or password were incorrect."
            redirect_to signin_path
        end
  end

  def destroy
       session.delete :user_id

       redirect_to root_path
   end

   private

end