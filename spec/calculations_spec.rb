require 'calculations'

describe Calculations do
  let(:item1) { double(code: :"001", name: "Lavender heart", price: 9.25) }
  let(:item2) { double(code: :"002", name: "Personalised cufflinks", price: 45) }
  let(:item3) { double(code: :"003", name: "Kids T-shirt", price: 19.95) }
  let(:promo1) { Promotion.new(id: :"promo1", type: :"multiple_buy",params: { article: :"001", price: 8.50 }) }
  let(:promo2) { Promotion.new(id: :"promo2", type: :"vol_discount", params: { min_purchase: 60, discount: 0.1 }) }
  let(:basket) {Basket.new() }

  # subject(:basketco) { described_class.new(basket, promotion_rules) }


  before do
    # @promo1 = Promotion.new(id: :"promo1", type: :"multiple_buy",params: { article: :"001", price: 8.50 })
    # @promo2 = Promotion.new(id: :"promo2", type: :"vol_discount", params: { min_purchase: 60, discount: 0.1 })
    @promo_multiple = PromotionRules.new(promo1)
    @promo_vol = PromotionRules.new(promo2)
    basket.add(item1)
    basket.add(item2)
    basket.add(item1)
    basket.add(item3)
    basket.add(item2)
  end

  it "with no promo rules, basket is sum of items price" do
    basket_no_promos = Calculations.new(basket, nil)
    expect(basket_no_promos.total).to eq 128.45
  end

  it "applies vol_discount rule" do
    basket_vol = Calculations.new(basket, @promo_vol)
    expect(basket_vol.total).to be_within(0.006).of(115.61)
  end

  xit "applies correctly one multiple buy " do
    basket_promo_multiple = Calculations.new(basket, @promo_multiple)
    expect(basket_promo_multiple.total).to eq 126.95
  end

end