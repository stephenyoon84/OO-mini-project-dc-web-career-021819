class Recipe
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_popular
    counts = {}
    RecipeCard.all.each do |x|
      if counts[x.recipe]
        counts[x.recipe] += 1
      else
        counts[x.recipe] = 0
      end
    end
    counts.max_by{|k, v| v}[0]
  end

  def users
    RecipeCard.all.select{|x| x.recipe == self}.collect{|x| x.user}
  end

  def ingredients
    RecipeIngredient.all.select{|x| x.recipe == self}.collect{|x| x.ingredient}
  end

  def allergens
    Allergen.all.select{|x| self.ingredients.include?(x.ingredient)}.collect{|x| x.ingredient}
  end

  def add_ingredients(ingredient_arr)
    ingredient_arr.each{|x| RecipeIngredient.new(self, x)}
  end
end
