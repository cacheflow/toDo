class TasksController < ApplicationController
  before_action :find_task, :only => [:edit, :update, :show, :destroy]

  def index 
    @tasks = Task.all 
  end 

  def new 
    @task = Task.new(task_params)
  end 

  def create 
    @task = Task.new(task_params)
    if @task.save 
      redirect_to tasks_path
    else 
      render :new 
    end 
  end 

  def find_task 
    @task = Task.find(params[:id])
  end 

  def show 
  end 

  def edit 
  end 

  def update
    if @task.update(task_params)
      redirect_to tasks_path(@path)
    else 
      render :edit 
    end 
  end 

  def destroy 
  end 

  protected 
    def task_params
      params.fetch(:task, {}).permit(:item, :user_id)
    end 


end
