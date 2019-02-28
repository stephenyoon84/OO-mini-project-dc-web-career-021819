class Ingredient
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_common_allergen
    counts = {}
    Allergen.all.each do |x|
      if counts[x]
        counts[x] += 1
      else
        counts[x] = 0
      end
    end
    counts.max_by{|k, v| v}[0].ingredient
  end
end
