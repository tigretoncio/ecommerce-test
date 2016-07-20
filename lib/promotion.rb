class Promotion

  attr_reader :promo_id, :promo_type, :params

  def initialize(promo_id:, promo_type:, params:)
    raise "error: entry not correct" if promo_id.nil? || promo_type.nil? || params.nil?
    @promo_id = promo_id
    @promo_type = promo_type
    @params = params
  end
end