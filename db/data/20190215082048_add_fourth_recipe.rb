class AddFourthRecipe < SeedMigration::Migration
  def up
    # Create recipe
    Recipe.create!(
      title: "Beginner's Bread",
      description: "This is my favorite bread recipe for when I’m in a pinch. It doesn’t take too long, there isn’t any special preparation, and the dough is pretty forgiving. All that, and it still tastes great because of the dutch oven baking process",
      user_id: 2,
      picture: open(File.join(Rails.root, "app/assets/images/beginners-bread.png"))
    )

    # Create ingredients 
    recipe = Recipe.find_by(title: "Beginner's Bread")
    [
      "2.25 teaspoons (1 packet) active dry yeast",
      "1 teaspoon sugar",
      "1.25 cups warm water",
      "1.5 teaspoons kosher salt",
      "1.5 cups whole wheat flour",
      "1 cup all purpose flour, plus more for dusting",
      "Optional: flax seeds for rolling"
    ].each do |item|
      Ingredient.create!(name: item, recipe_id: recipe.id)
    end
    
    # Add steps
    [
      "First, dissolve the sugar in the warm water. Activate the yeast by mixing it in the sugar water and letting it sit for 5 minutes, until foamy.",
      "After that, mix in the salt.",
      "Add the whole wheat flour and whisk in little by little, making sure each addition is fully hydrated (at this point, it shouldn’t look at all like a dough.)",
      "Begin to add the all purpose flour in even smaller additions. When you can no longer use a whisk, pour it out onto a work surface to incorporate by hand.",
      "The dough will be pretty loose at this point. Dust your hands and work surface with flour to lightly knead the dough into something workable.",
      "The dough will still be loose. Dust the work surface and top of the dough with flour and let proof for an hour until at least doubled in size- the autolyse stage.",
      "You should notice a dramatic change in the dough’s texture after you take it out. Knead the dough again, using more flour as needed - don’t go overboard, though. If the dough feels wet, keep kneading and see if anything changes. The gluten might not be developed enough. However, if need be, don’t be scared to dust a little more all purpose flour on top and keep kneading.",
      "Proof the dough for another 45 minutes, until doubled in size.",
      "Place the dutch oven, lid on, into the oven and preheat to 460o F.",
      "After this proof, turn the dough out onto your work surface. Pull the dough from the bottom edges on top, making a seam on top. Work your way around the dough a few times until the edges feel tighter to pull.",
      "If you want the flax seeds on top, now is when you should roll the dough in them.",
      "If you have a proofing basket, put the loaf seam side down into the basket and cover. If you don’t have a proofing basket, a large bowl dusted with flour can work. can work.",
      "After about 30 minutes when the dutch oven is well preheated and the dough has risen, place the dough seam side up into the dutch oven.",
      "Bake for 30 minutes with the lid on, then another 10-20 minutes without the lid until golden brown on top.",
    ].each do |item|
      Direction.create!(step: item, recipe_id: recipe.id)
    end
  end

  def down
    Recipe.find(4).delete
  end
end
