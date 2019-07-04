class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :taskid, null: false, index: { unique: true }
      t.datetime :start_time
      t.datetime :end_time
      t.string :topic, null: false
      t.text :content
      t.integer :priority, :default => 0, null: false
      t.integer :status, :default => 0, null: false
      t.integer :category_id

      t.timestamps
    end
  end
end
