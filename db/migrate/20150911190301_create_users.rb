class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.integer :phone_num
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
