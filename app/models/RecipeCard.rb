class RecipeCard
  attr_accessor :user, :recipe, :date, :rating
  @@all = []

  def initialize(user, recipe, date, rating)
    @user, @recipe, @date, @rating = user, recipe, date, rating
    @@all << self
  end

  def self.all
    @@all
  end

  # def date
  #
  # end
  #
  # def rating
  #
  # end
  #
  # def user
  #
  # end
  #
  # def recipe
  #
  # end
end
