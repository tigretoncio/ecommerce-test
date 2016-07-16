require 'checkout'

describe Checkout do
  let(:item1) { double(item_code: :"001", name: "Lavender heart", price: 9.25) }
  let(:item2) { double(item_code: :"002", name: "Personalised cufflinks", price: 45) }
  let(:item3) { double(item_code: :"003", name: "Kids T-shirt", price: 19.95) }
  subject(:checkout) { described_class.new }

  context "initialization" do
    it "total is zero" do
      expect(checkout.total).to eq 0
    end
  end
end