require 'promotion_rules'

describe PromotionRules do
  let(:promotion) { double(promo_type: "bundle", params: { item: :"001", quantity: 2, unit_price: 8.50 })}
  subject(:rules) { described_class.new()}

  it "starts with an empty promotion rule file" do
    expect(rules.first).to be_nil
  end

  it "adds a promotion" do
    rules.add(promotion)
    expect(rules.first).to eq promotion
  end
end