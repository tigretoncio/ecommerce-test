class PromotionRules
  include Enumerable

  def initialize()
    @all = []
  end

  def add(promotion)
    all << promotion
  end

  def remove(promotion_id)
  end

  def each(&block)
    all.each(&block)
  end

  private

  attr_reader :all

end