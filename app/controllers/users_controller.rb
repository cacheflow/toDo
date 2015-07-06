class UsersController < ApplicationController
  before_action :find_user, :only => [:edit, :update, :destroy, :mark_completed]


  def show 
    @user = User.find(params[:id])
  end 

  def new 
    @user = User.new 
  end 

  def my_tasks  
    @my_tasks = current_user.tasks.where(completed: false)
  end 

  def completed_tasks 
    @completed_tasks = current_user.tasks.where(completed: true)
  end 

  def find_user 
    @user = current_user 
  end 

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      flash[:info] = "You successfully created an account and logged in"
      redirect_to root_url 
    else 
      render :new 
    end 
  end 

  def update 
    if @user.update(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user 
    end 
  end 
    

  def destroy
    flash[:success] = "Account deleted"
    redirect_to users_url
  end 

  def user_params
    params.require(:user).permit(:name, :email, :password, :avatar)
  end 

  def task_params 
    params.require(:task).permit(:item, :completed)
  end 

end 