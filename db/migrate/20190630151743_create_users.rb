class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :uid, null: false, index: { unique: true }
      t.string :name, null: false
      t.string :username, null: false
      t.string :passwd, null: false
      t.integer :role, :default => 0, null: false

      t.timestamps
    end
  end
end
