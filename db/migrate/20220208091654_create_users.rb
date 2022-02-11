class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :schoolname, null: false
      t.string :email, null: false
      t.string :address, null: false
      t.string :telephonenumber, null: false
      t.string :password_digest, null: false

      t.timestamps
      t.index :schoolname, unique: true
      t.index :email, unique: true
      t.index :address, unique: true
      t.index :telephonenumber, unique: true
    end
  end
end
