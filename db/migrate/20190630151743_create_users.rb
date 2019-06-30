class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :uid
      t.string :name
      t.string :username
      t.string :passwd
      t.integer :role

      t.timestamps
    end
  end
end
