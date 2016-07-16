class Checkout
  attr_reader :total

  def initialize
    @total = 0
  end

  def scan
    true
  end

end