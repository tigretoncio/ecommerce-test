class Checkout

  def initialize(basket, promo_rules)
    @basket = basket
    @promo_rules = promo_rules

  end

  def scan(item)
    basket << item
  end

  def total
    return 0 if basket.empty?
    return basket[0].price
  end

  private

  attr_reader :basket, :promo_rules

end