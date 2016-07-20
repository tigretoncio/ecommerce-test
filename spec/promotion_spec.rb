require 'promotion'

describe Promotion do

  subject(:promotion) { described_class.new(promo_id: :"promo1", promo_type: :"qty_discount",params: { article: :"001", promo_price: 8.50 }) }
  let(:error_promo) { described_class.new(promo_id: nil, promo_type: :"qty_discount",params: { article: :"001", promo_price: 8.50 }) }
  let(:error_promo2) { described_class.new(promo_id: :"promo1", promo_type: nil,params: {  }) }
  let(:error_promo3) { described_class.new(promo_id: :"promo1", promo_type: :"qty_discount",params: nil) }

  before do
    @promo_id = :"promo1"
    @promo_type = :"qty_discount"
    @description = "2 Lavender heart, unit price 8.50"
    @params = { article: :"001", promo_price: 8.50 }
  end

  it "with one parameter not filled, throws error" do
    expect { error_promo }.to raise_error(RuntimeError, "error: entry not correct")
    expect { error_promo2 }.to raise_error(RuntimeError, "error: entry not correct")
    expect { error_promo3 }.to raise_error(RuntimeError, "error: entry not correct")

  end

  it "has parameters name, description, and promo_params" do
    expect(promotion.promo_id).to eq @promo_id
    expect(promotion.promo_type).to eq @promo_type
    expect(promotion.params).to eq @params
  end
end