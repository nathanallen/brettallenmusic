class SheetMusic < ActiveRecord::Base
  has_many :arrangements


  # def get_arrangements
  #   if arrangements.count > 1 #multiple_arrangements
  #     return arrangements.map{|a| a.version }
  #   elsif arrangements.first.parts.count > 2 #multiple_parts
  #     return arrangements.first.parts.map{|part| part.instrument }
  #   else
  #     return arrangements.first.version #one_arrangement
  #   end
  # end

end
