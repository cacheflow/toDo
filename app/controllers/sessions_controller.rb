class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.where(email: params[:session][:email]).first
    if user && user.authenticate(params[:session][:password])
      login(user)
      redirect_to tasks_path
      flash[:success] = "You've successfully logged in"
    else 
      flash[:warning] = "Uh oh doesn't seem to be right. Try to login again"
      render :new 
    end   
  end

  def destroy
    session.delete(:remember_token)
    @current_user = nil
    redirect_to new_session_path
  end
end
