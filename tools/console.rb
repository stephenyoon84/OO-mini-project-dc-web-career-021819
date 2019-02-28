require_relative '../config/environment.rb'


# recipe1 = Recipe.new("hot dog")
# recipe2 = Recipe.new("pizza")
# recipe3 = Recipe.new("salad")
#
# user1 = User.new("A")
# user2 = User.new("B")
# user3 = User.new("C")
#
# recipecard1 = user1.add_recipe_card(recipe1, "03-31-2018", 5)
# recipecard2 = user2.add_recipe_card(recipe1, "01-24-2018", 3)
# recipecard3 = user3.add_recipe_card()

flour = Ingredient.new('Flour')
egg = Ingredient.new('Egg')
milk = Ingredient.new('Milk')
cheese = Ingredient.new('Cheese')
pepper = Ingredient.new('Pepper')
lettuce = Ingredient.new('Lettuce')
dressing = Ingredient.new('Dressing')
carrot = Ingredient.new('Carrot')

brit = User.new('Brit')
emily = User.new('Emily')
norma = User.new('Norma')

pancake = Recipe.new('Pancake')
pancake.add_ingredients([flour, egg, milk])
omelette = Recipe.new('Omelette')
omelette.add_ingredients([egg, milk, cheese, pepper])
salad = Recipe.new('Salad')
salad.add_ingredients([lettuce, cheese, pepper, dressing])
carrot_with_dressing = Recipe.new('Carrot with dressing')
carrot_with_dressing.add_ingredients([carrot, dressing])

a = brit.add_recipe_card(pancake, '2018-11-28', 100)
b = brit.add_recipe_card(omelette, '2018-11-29', 90)
c =brit.add_recipe_card(salad, '2018-11-29', 95)
d =brit.add_recipe_card(carrot_with_dressing, '2018-11-30', 80)
e = emily.add_recipe_card(omelette, '2018-11-30', 99)
f = emily.add_recipe_card(salad, '2018-11-29', 97)
g = norma.add_recipe_card(salad, '2018-11-29', 100)

aa = brit.declare_allergen(carrot)
bb = brit.declare_allergen(dressing)
cc = emily.declare_allergen(carrot)
dd = emily.declare_allergen(pepper)

puts Recipe.all == [pancake, omelette, salad, carrot_with_dressing]
puts Recipe.most_popular == salad
puts Ingredient.most_common_allergen == carrot
puts pancake.users == [brit]
puts pancake.ingredients == [flour, egg, milk]
puts carrot_with_dressing.allergens == [carrot, dressing, carrot]
# puts pancake.add_ingredients([cheese])
# puts pancake.ingredients.map{|x| x.name}
puts User.all == [brit, emily, norma]
puts brit.recipes == [pancake, omelette, salad, carrot_with_dressing]
# puts norma.add_recipe_card(pancake, '2018-11-28', 100).recipe.name
# puts norma.recipes.map{|x| x.name}
# puts norma.declare_allergen(milk)
# puts norma.allergens == [milk]
puts brit.top_three_recipes == [pancake, salad, omelette]
puts brit.most_recent_recipe == carrot_with_dressing
puts RecipeCard.all == [a, b, c, d, e, f, g]
puts a.date == '2018-11-28'
puts a.rating == 100
puts a.user == brit
puts a.recipe == pancake
puts Ingredient.all == [flour, egg, milk, cheese, pepper, lettuce, dressing, carrot]
puts Ingredient.most_common_allergen == carrot
puts RecipeIngredient.all
puts RecipeIngredient.all.collect{|x| x.ingredient}
puts RecipeIngredient.all.collect{|x| x.recipe}
puts Allergen.all == [aa, bb, cc, dd]
puts brit.safe_recipes == [pancake, omelette, salad]
puts norma.safe_recipes == [pancake, omelette, salad, carrot_with_dressing]

# binding.pry
