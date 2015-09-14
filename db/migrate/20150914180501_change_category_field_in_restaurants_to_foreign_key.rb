class ChangeCategoryFieldInRestaurantsToForeignKey < ActiveRecord::Migration
  def change
    remove_column :restaurants, :category
    add_column :restaurants, :category_id, :integer
  end
end
