class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.belongs_to :user, index: true, foreign_key: true
      t.string :address
      t.string :price_range
      t.string :category
      t.string :hours_of_operation
      t.integer :phone_num
      t.text :summary

      t.timestamps null: false
    end
  end
end
