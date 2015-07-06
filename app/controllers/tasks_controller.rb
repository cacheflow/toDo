class TasksController < ApplicationController
  before_action :find_task, :only => [:edit, :update, :show, :destroy]

  def index 
    @tasks = Task.order(created_at: :desc)
  end   

  def new 
    @task = Task.new
  end 

  def create 
    @task = current_user.tasks.new(tasks_params)
    respond_to do |format|
    if @task.save 
        format.html
        format.js
      else
        format.html { render :new }
        format.js
      end
    end 
  end

  def update
    if @task.update(tasks_params)
      redirect_to user_my_tasks_path(@task)
    else 
      render :edit 
    end 
  end 

  def destroy 
    @task.destroy 
    redirect_to user_my_tasks_path(@task)
  end 


  protected 
    def tasks_params
      params.require(:task).permit(:item, :completed, :deleted_at)
    end  

    def find_task 
      @task = Task.includes(:user).find(params[:id])
    end 

end
