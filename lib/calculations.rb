class Calculations
  attr_reader :basket, :promo_rules

  def initialize(basket, promo_rules)
    @basket = basket
    @promo_rules = promo_rules
    @discount = 0
    @min_buy = -1
  end

  def total()
    result = basket.sum
    # process_multiple_buys
    # identify rules "bulk"
    # change prices in basket from these rules
    # identify rule "volume"
    # sum basket and apply volume discount
    if discount_rule?
      process_discount_rule
      p "result: #{result} || min_buy: #{min_buy} || min_buy: #{min_buy} || discount: #{discount}"
      result > min_buy ? result *= (1-discount) : result
    end
    result
  end

  private

  attr_reader :discount, :min_buy

  def discount_rule?
    promo_rules && !promo_rules.select { |rule| rule.type == :vol_discount }.empty?
  end

  def process_discount_rule
    return if promo_rules.nil?
    discount_rule = promo_rules.select { |rule| rule.type == :vol_discount }
    return if discount_rule.nil?
    @discount = discount_rule.first.params[:discount]
    @min_buy = discount_rule.first.params[:min_purchase]
  end

  def process_multiple_buys
  end

end