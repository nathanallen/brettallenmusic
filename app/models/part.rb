class Part < ActiveRecord::Base
  has_many :items
  belongs_to :arrangement

  def price
    p "YA"
    items.where(vendor: "BAM").first.price
  end


end
