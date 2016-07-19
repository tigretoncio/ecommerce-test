class Promotion

  attr_reader :promo_type, :params

  def initialize(promo_type: nil, params: nil)
    @promo_type = promo_type
    @params = params
  end
end