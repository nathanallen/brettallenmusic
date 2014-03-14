class Part < ActiveRecord::Base
  has_many :items
  belongs_to :arrangement

  def price
    i = items.where(vendor: "BAM").first
    i ? i.price : items.first.price
  end

  def price_in_cents
    price.match(/\d{2}/).to_s << "00"
  end

end
