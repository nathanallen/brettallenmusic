class Item < ActiveRecord::Base
  belongs_to :part
  has_and_belongs_to_many :orders
end
