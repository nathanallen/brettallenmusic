class Part < ActiveRecord::Base
  has_many :items
  belongs_to :arrangement

  def price
    i = items.where(vendor: "BAM").first
    i ? i.price : items.first.price
  end


end
