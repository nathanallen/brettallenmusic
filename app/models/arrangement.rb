class Arrangement < ActiveRecord::Base
  has_many :parts
  belongs_to :sheet_music
end
