class Allergen
  attr_accessor :user, :ingredient
  @@all = []

  def initialize(user, ingredient)
    @user, @ingredient = user, ingredient
    @@all << self
  end

  def self.all
    @@all
  end
end
