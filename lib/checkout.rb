class Checkout
  attr_reader :basket

  def initialize(promo_rules)
    @promo_rules = promo_rules
    @basket = []
  end

  def scan(item)
    basket << item
    true
  end

  def total
    return 0 if basket.empty?
    return basket[0].price
  end

  private

  attr_reader :promo_rules

end