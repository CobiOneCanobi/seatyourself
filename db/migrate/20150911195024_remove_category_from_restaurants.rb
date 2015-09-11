class RemoveCategoryFromRestaurants < ActiveRecord::Migration
  def change
    remove_column :restaurants, :catagory
  end
end
