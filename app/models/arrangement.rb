class Arrangement < ActiveRecord::Base
  has_many :parts
  belongs_to :sheet_music

  def price
    parts.first.price
  end

  def price_in_cents
    parts.first.price_in_cents
  end

end
