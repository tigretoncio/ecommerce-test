require 'promotion_rules'

describe PromotionRules do
  let(:promo1) { Promotion.new(id: :"promo1", type: :"qty_discount",params: { article: :"001", qty: 2, price: 8.50 }) }
  let(:promo2) { Promotion.new(id: :"promo2", type: :"vol_discount", params: { min_purchase: 60, discount: 0.1 }) }

  subject(:rules) { described_class.new()}

  it "on initialization, empty" do
    expect(rules).to be_empty
  end

  it "adds a promotion" do
    rules.add(promo2)
    expect(rules.first.type).to eq :"vol_discount"
  end

  it "removes a promotion" do
    rules.add(promo1)
    rules.add(promo2)
    rules.remove(:"promo1")
    expect(rules.count).to eq 1
    expect(rules.first.id).to eq :"promo2"
  end
end