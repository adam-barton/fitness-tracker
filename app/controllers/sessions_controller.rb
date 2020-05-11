class SessionsController < ApplicationController
    # skip_before_action :current_user, only: [:create]
    skip_before_action :redirect_if_not_logged_in, only: [:new, :create]

  def new
    session.delete :auth_token
    @user = User.new
  end

  def create
      @user = User.find_by(email: params[:user][:email])
        if @user && @user.authenticate(params[:user][:password])

            session[:auth_token] = @user.auth_token

            redirect_to @user
        else
            flash[:message] = "Your email or password were incorrect."
            redirect_to signin_path
        end
  end

  def destroy
      session.delete :auth_token

       redirect_to signin_path
   end

   private

end