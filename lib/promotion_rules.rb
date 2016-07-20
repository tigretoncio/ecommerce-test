class PromotionRules
  include Enumerable

  def initialize()
    @all = []
  end

  def add(promotion)
    raise "error, not a promotion" unless promotion.is_a?(Promotion)
    all << promotion
  end

  def remove(promotion_id)
    @all.delete_if{ |promo| promo.id == promotion_id}
  end

  def each(&block)
    all.each(&block)
  end

  def empty?
    @all.empty?
  end

  private

  attr_reader :all

end