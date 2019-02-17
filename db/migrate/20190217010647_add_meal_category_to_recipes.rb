class AddMealCategoryToRecipes < ActiveRecord::Migration[5.1]
  def change
    add_column :recipes, :meal_category, :string
  end
end
