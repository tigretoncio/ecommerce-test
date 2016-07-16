class Checkout
  attr_reader :total, :basket

  def initialize
    @total = 0
    @basket = []
  end

  def scan
    true
  end

  private

  # attr_reader :basket

end