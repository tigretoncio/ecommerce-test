class Calculations
  attr_reader :basket, :promo_rules

  def initialize(basket, promo_rules)
    @basket = basket
    @promo_rules = promo_rules
    @discount = 0
    @min_buy = -1
  end

  def total()
    # process_multiple_buys

    result = basket.sum

    # identify rules "bulk"
    # change prices in basket from these rules
    # identify rule "volume"
    # sum basket and apply volume discount
    process_discount_rule
    result > min_buy ? result *= (1-discount) : result
  end

  private

  attr_reader :discount, :min_buy

  def process_discount_rule
    return if promo_rules.nil?
    discount_rule = promo_rules.select { |rule| rule.type == :vol_discount }
    return if discount_rule.empty?
    @discount = discount_rule.first.params[:discount]
    @min_buy = discount_rule.first.params[:min_purchase]
  end

  def process_multiple_buys
  end

end