class User
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def recipes
    RecipeCard.all.select{|x| x.user == self}.collect{|x| x.recipe}
  end

  def add_recipe_card(recipe, date, rating)
    RecipeCard.new(self, recipe, date, rating)
  end

  def declare_allergen(ingredient)
    Allergen.new(self, ingredient)
  end

  def allergens
    Allergen.all.select{|x| x.user == self}.collect{|x| x.ingredient}
  end

  def top_three_recipes
    RecipeCard.all.select{|x| x.user == self}.sort_by do |x|
      x.rating
    end.reverse.first(3).map{|x| x.recipe}
  end

  def most_recent_recipe
    self.recipes[-1]
  end

  def safe_recipes
    RecipeIngredient.all.select do |x|
      x.recipe if !self.allergens.map{|x| x.name}.include?(x.ingredient.name)
      # binding.pry
    end.collect{|x| x.recipe}.uniq
  end
end
