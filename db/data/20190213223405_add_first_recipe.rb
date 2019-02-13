class AddFirstRecipe < SeedMigration::Migration
  def up
    # Create Vegan Chocolate Cinnamon babka recipe
    Recipe.create!(
      title: "Vegan Chocolate Cinnamon Babka",
      description: "This recipe is based on one from Holy Cow Vegan, but I have simplified it a bit.",
      user_id: 8,
      picture: open(File.join(Rails.root, "app/assets/images/vegan-chocolate-cinnamon-babka.jpg"))
    )

    # Create vegan chocolate cinnamon babka ingredients 
    recipe = Recipe.find_by(title: "Vegan Chocolate Cinnamon Babka")
    [
      "4-5 cups of all purpose flour",
      "1 packet or 2 1/4 tsp active dry yeast",
      "1/2 cup warm nondairy milk",
      "1/3 cup sugar",
      "Zest of 1 lemon",
      "1/2 tsp nutmeg",
      "3/4 cup aquafaba",
      "2 tsp vanilla extract",
      "8 tbsp vegan butter/margarine (room temperature)",
      "1 tsp salt",
      "9 oz vegan chocolate chips (or 1 bar vegan baking chocolate)",
      "1 tsp cinnamon",
      "1/4 cup vegan butter or margarine"
    ].each do |item|
      Ingredient.create!(name: item, recipe_id: recipe.id)
    end

    [
      "First, make the dough. Mix the yeast and milk, and let it sit for five minutes, by which point it should be bubbling and frothing. This is how you know the yeast is alive.",
      "Place the flour in a large mixing bowl. Add salt, sugar, lemon zest, nutmeg, and vanilla. Mix well.",
      "Add the aquafaba. Are you wondering what aquafaba is and how to get it? Easy! It’s the juice from cooking chickpeas. Just buy a can of chickpeas, drain the fluid into a container, and voila! You have aquafaba! It’s a great egg replacer and I promise it doesn’t make your cooking taste beany or anything. Plus you can eat the chickpeas as a snack.",
      "Mix the dough. If it’s too sticky, add small amounts of flour at a time until you get a smooth and elastic dough.",
      "Add the butter 4 tbsp at a time. Again, if the dough becomes too sticky, you can always add some more flour. Just do it slowly.",
      "Place the ball of dough in an oiled bowl and loosely cover. Let it sit for 2 hours, then punch the dough down, cover, and place in the fridge for at least six hours.",
      "To make the chocolate cinnamon filling, melt the chocolate, cinnamon, and margarine over a double boiler until smooth. Do this just before you remove the dough from the fridge after resting overnight.",
      "Separate the dough into two equal portions, and roll each one into a large rectangle. Spread the chocolate mixture evenly over each rectangle on one side.",
      "Carefully roll each square of dough up into a long, thin log. Cover with a towel and place in the freezer for ten minutes.",
      "Remove each roll from the freezer and cut them both in half lengthwise, which will expose the filling inside. Twist or braid the two halves together, then nestle them into two separate pans – I used a loaf pan but a round or small square pan would be OK too. Place the loaf pans, covered, in a warm place to rise for another hour and a half.",
      "Preheat the oven to 350 degrees F, then bake for about 50 minutes. Let the cakes cool and then they are ready to serve!"
    ].each do |item|
      Direction.create!(step: item, recipe_id: recipe.id)
    end
  end

  def down
    Recipe.find(1).delete
  end
end
