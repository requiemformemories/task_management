class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :taskid
      t.datetime :start_time
      t.datetime :end_time
      t.string :topic
      t.text :content
      t.integer :priority
      t.integer :status
      t.string :cat

      t.timestamps
    end
  end
end
