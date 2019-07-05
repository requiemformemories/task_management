class CreateUserTaskships < ActiveRecord::Migration[5.2]
  def change
    create_table :user_taskships do |t|
      t.integer :user_id, null: false
      t.integer :task_id, null: false

      t.timestamps
    end
  end
end
