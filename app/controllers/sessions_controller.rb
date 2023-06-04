class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    session_params = params[:session].permit(:email, :password)
    @user = User.find_by(email: session_params[:email])
    if @user && @user.authenticate(session_params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:error] = "Login is invalid!"
      render :new, status: :unprocessable_entity
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
