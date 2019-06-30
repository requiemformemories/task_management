class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :catid
      t.string :catname

      t.timestamps
    end
  end
end
