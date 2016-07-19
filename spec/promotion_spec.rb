require 'promotion'

describe Promotion do

  let(:promotion_qty) { described_class.new(promo_type: :"quantity_discount",
    params: { article: :"001", promo_price: 8.50 }) }

  it "has parameters name, description, and promo_params" do
    promo_type = :"quantity_discount"
    description = "2 Lavender heart, unit price 8.50"
    params = { article: :"001", promo_price: 8.50 }

    expect(promotion_qty.promo_type).to eq promo_type
    expect(promotion_qty.params).to eq params
  end
end