class AddTempDeleteToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :temp_delete, :boolean
  end
end
