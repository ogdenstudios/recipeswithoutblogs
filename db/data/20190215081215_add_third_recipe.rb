class AddThirdRecipe < SeedMigration::Migration
  def up
    # Create recipe
    Recipe.create!(
      title: "Maple Brown Butter Pork Chops",
      description: "These pork chops blend together the best sweet and savory flavors of New England. A real comfort food, they taste best on a Fall day. Try different side vegetables that would match the dish’s flavor - potatoes, yams, brussel sprouts - whatever you’d like. They’re sure to please.",
      user_id: 2,
      picture: open(File.join(Rails.root, "app/assets/images/maple-brown-butter-pork-chops.png"))
    )

    # Create ingredients 
    recipe = Recipe.find_by(title: "Maple Brown Butter Pork Chops")
    [
      "4 pork chops",
      "1 Head of cauliflower",
      "2 Apples",
      "2 Onions",
      "1/4 cup butter + more for pan",
      "1 tablespoon salt",
      "1/2 teaspoon cinnamon",
      "Black pepper and chili flakes to taste",
      "4 Tablespoons apple cider vinegar",
      "3 tbsp maple syrup",
      "1 clove garlic",
      "1/4 cup butter",
      "2 tablespoons maple syrup"
    ].each do |item|
      Ingredient.create!(name: item, recipe_id: recipe.id)
    end
    
    # Add steps
    [
      "First, rub spice blend on the pork chops.",
      "Mix together 4 tbsp apple cider vinegar, 1 miced clove of garlic, and 3 tbsp syrup.",
      "Put chops in, coat in marinade, drizzle remaining syrup over top",
      "Marinate 1 hour",
      "Slice the apples and onions. Reduce them down in a saucepan with a pad of butter, salt, and pepper -- heat on high to brown, then turn down to low and cover, stirring occasionally.",
      "Preheat oven to 425",
      "Cut the  cauliflower. Season with the second mix of the spice blend - to taste: they may need less salt. Drizzle with olive oil. Roast for 40 minutes, tossing occasionally.",
      "In another saucepan on medium high heat, add the ¼ cup of butter until it begins to brown. Once it has reached a deep brown color, turn the heat down, add the maple syrup, and cover.",
      "Begin to grill pork chops over medium. Add a pad of butter to pan, and make sure it begins browning before adding pork chop. Cook chops for about 5 minutes each side, covered, checking for color on the side facing down.",
      "For final plating, I like to lay the pork chops over a bed of cauliflower with the apples, onions, and brown butter blanketing the whole dish."
    ].each do |item|
      Direction.create!(step: item, recipe_id: recipe.id)
    end
  end

  def down
    Recipe.find(3).delete
  end
end