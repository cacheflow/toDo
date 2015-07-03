class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.text :item
      t.references :user, index: true 
      t.timestamps null: false
    end
  end
end
