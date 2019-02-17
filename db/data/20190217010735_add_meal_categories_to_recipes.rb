class AddMealCategoriesToRecipes < SeedMigration::Migration
  def up
    Recipe.find(1).update_column(:meal_category, "dessert")
    Recipe.find(2).update_column(:meal_category, "dinner")
    Recipe.find(3).update_column(:meal_category, "dinner")
    Recipe.find(4).update_column(:meal_category, "other")
  end
end
