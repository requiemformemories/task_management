class CreateTagTaskships < ActiveRecord::Migration[5.2]
  def change
    create_table :tag_taskships do |t|
      t.integer :tag_id, null: false
      t.integer :task_id, null: false

      t.timestamps
    end
  end
end
