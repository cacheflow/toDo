class Users::TasksController < ApplicationController
  before_action :find_task

  def update
    if @task.update(tasks_params)
      redirect_to user_my_tasks_path
    else 
      render :edit 
    end 
  end 

  private
  
  def tasks_params
    params.require(:task).permit(:item, :completed, :deleted_at)
  end 

  def find_task 
    @task = current_user.tasks.find_by_id(params[:id])
  end 

end
