class UsersController < ApplicationController

  def new 
    @users = User.all 
  end

  def show 
    @user = User.find(params[:id])
  end 

  def new 
    @user = User.new 
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
    User.find(params[:id]).destroy
    flash[:success] = "Account deleted"
    redirect_to users_url
  end 

  def user_params
    params.fetch(:user, {}).permit(:name, :email, :password)
  end 

end 
