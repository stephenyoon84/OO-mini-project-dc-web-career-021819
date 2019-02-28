class RecipeIngredient
  attr_accessor :recipe, :ingredient
  @@all = []

  def initialize(recipe, ingredient)
    @recipe, @ingredient = recipe, ingredient
    @@all << self
  end

  def self.all
    @@all
  end
  #
  # def ingredient
  #
  # end
  #
  # def recipe
  #
  # end
end
