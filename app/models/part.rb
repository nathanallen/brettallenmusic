class Part < ActiveRecord::Base
  has_many :items
  belongs_to :arrangement
end
