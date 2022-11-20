class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new create]
  before_action :find_user
  def new; end

  def create
    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_back_or(tests_path)
    else
      flash.now[:alert] = 'Are you s Guru? Verify your Email and Password please'
      render :new
    end
  end

  def destroy
    if session[:user_id]
      session.delete(:user_id)
      flash[:alert] = 'You have successfully logged out'
    end
    redirect_to login_path
  end

  private

  def find_user
    @user = User.find_by(email: params[:email])
  end
end
