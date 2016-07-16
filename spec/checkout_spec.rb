require 'checkout'

describe Checkout do
  let(:item1) { double(item_code: :"001", name: "Lavender heart", price: 9.25) }
  let(:item2) { double(item_code: :"002", name: "Personalised cufflinks", price: 45) }
  let(:item3) { double(item_code: :"003", name: "Kids T-shirt", price: 19.95) }
  let(:promo_rules) { double()}
  subject(:checkout) { described_class.new(promo_rules) }

  context "initialization" do
    it "total is zero" do
      expect(checkout.total).to eq 0
    end
  end

  context "scan" do
    it "scanning an item returns true" do
      expect(checkout.scan(item1)).to eq true
    end

    it "basket is empty before scanning" do
      # basket made  public to pass this test, think if it should really be private? and
      #remove this?
      expect(checkout.basket).to eq []
    end

    it "item is added after scanning" do
      checkout.scan(item1)
      expect(checkout.basket).to include item1
    end
  end
end