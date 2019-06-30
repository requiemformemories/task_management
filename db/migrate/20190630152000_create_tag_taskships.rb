class CreateTagTaskships < ActiveRecord::Migration[5.2]
  def change
    create_table :tag_taskships do |t|
      t.string :ttid
      t.string :tag
      t.string :task

      t.timestamps
    end
  end
end
