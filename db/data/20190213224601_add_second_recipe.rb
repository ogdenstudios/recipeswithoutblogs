class AddSecondRecipe < SeedMigration::Migration
  def up
    # Create Vegan Chocolate Cinnamon babka recipe
    Recipe.create!(
      title: "Egg Drop Soup",
      description: "Quick, easy, and so much better than your local Chinese takeout place.",
      user_id: 4,
      picture: open(File.join(Rails.root, "app/assets/images/egg-drop-soup.jpg"))
    )

    # Create vegan chocolate cinnamon babka ingredients 
    recipe = Recipe.find_by(title: "Egg Drop Soup")
    [
      "8 cups of chicken broth (or 8 cups of water and 1 tablespoon of chicken bullion)",
      "1 tbsp + 2 tsp corn starch",
      "4 eggs",
      "1 bunch green onions",
      "1 tsp garlic powder or paste",
      "1 tsp ginger powder or paste",
      "1 tsp sesame oil",
      "1 tsp salt (or more, to taste)",
      "optional add ins: frozen dumplings, chopped mushrooms, chopped roasted and salted seaweed sheets, etc."
    ].each do |item|
      Ingredient.create!(name: item, recipe_id: recipe.id)
    end

    [
      "remove ends of green onions. chop into 1.5ish inch pieces on the diagonal. set aside.",
      "set stovetop to a medium heat. bring chicken broth (or water and bullion mix), sesame oil, garlic, ginger, and salt to a low simmer. add any optional mix in ingredients.",
      "remove approx 2 cups of broth and set in a mixing bowl. slowly whisk in 1 tbsp corn starch. add mixture back to the rest of the broth once incorporated and mix it in.",
      "add 4 eggs to the mixing bowl and whisk. slowly whisk in 2 tsp of corn starch into eggs (if you add it in all at once, the corn starch will separate into clumps and be difficult to mix in)",
      "turn stovetop down to low. hold a fork or whisk on the edge of the bowl with the egg mixture. slowly drizzle egg mixture through the tines of your utensil into the broth in a circular motion while following the edge of the pot.", 
      "once the egg mixture completely added, remove from heat and gently stir the bottom of the pot to ensure the eggs aren’t sticking to the bottom.",
      "add green onion. let the soup rest for a minute before stirring and serving."
    ].each do |item|
      Direction.create!(step: item, recipe_id: recipe.id)
    end
  end

  def down
    Recipe.find(2).delete
  end
end