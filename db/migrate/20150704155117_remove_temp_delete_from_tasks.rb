class RemoveTempDeleteFromTasks < ActiveRecord::Migration
  def change
    remove_column :tasks, :temp_delete, :boolean
  end
end
