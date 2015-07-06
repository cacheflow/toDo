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
    if @task.save 
      redirect_to tasks_path
    else 
      render :new 
    end 
  end


  def show 
    @task = Task.includes(:users).find(params[:id])
  end 


  def update
    if @task.update(tasks_params)
      redirect_to user_my_tasks_path(@task)
    else 
      render :edit 
    end 
  end 

  def destroy 
  end 


  protected 
    def tasks_params
      params.require(:task).permit(:item, :completed, :deleted_at)
    end  

    def find_task 
      @task = Task.find(params[:id])
    end 

end
