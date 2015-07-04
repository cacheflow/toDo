class Users::TasksController < ApplicationController
  before_action :find_task

  def update
    if params[:task][:completed] == "true"
      puts "THIS IS TRUE NIGGA"
      @task.update(tasks_params)
      redirect_to tasks_path(@path)
    else 
      render :edit 
    end 
  end 

  
  def edit 
  end 

  private
  
  def tasks_params
    params.require(:task).permit(:item, :completed, :deleted_at)
  end 

  def find_task 
    @task = current_user.tasks.find_by_id(params[:id])
  end 

end
