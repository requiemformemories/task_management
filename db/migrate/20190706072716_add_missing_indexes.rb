class AddMissingIndexes < ActiveRecord::Migration[5.2]
  def change
    add_index :tag_taskships, :tag_id
    add_index :tag_taskships, :task_id
    add_index :tasks, :category_id
    add_index :tasks, :start_time
    add_index :tasks, :end_time
    add_index :tasks, :topic
    add_index :tasks, :priority
    add_index :tasks, :status
    add_index :user_taskships, :task_id
    add_index :user_taskships, :user_id
  end
end
