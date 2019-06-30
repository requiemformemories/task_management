class CreateUserTaskships < ActiveRecord::Migration[5.2]
  def change
    create_table :user_taskships do |t|
      t.string :utid
      t.string :user
      t.string :task

      t.timestamps
    end
  end
end
