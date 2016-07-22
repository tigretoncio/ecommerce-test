class Checkout

  def initialize(basket: Basket.new, promo_rules: nil)
    @basket = basket
    @promo_rules = promo_rules
  end

  def scan(item)
    basket.add(item)
  end

  def total
    c = Calculations.new(basket,promo_rules)
    c.total
  end

  private

  attr_reader :basket, :promo_rules

end