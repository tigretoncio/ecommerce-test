class Checkout
  attr_reader :total, :basket

  def initialize(promo_rules)
    @promo_rules = promo_rules
    @total = 0
    @basket = []
  end

  def scan(item)
    basket << item
    true
  end

  private

  attr_reader :promo_rules

end