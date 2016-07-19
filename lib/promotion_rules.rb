class PromotionRules

  attr_reader :all

  def initialize()
    @all = []
  end

  def add(promotion)
    all << promotion
  end

  # make the class enumerable
end