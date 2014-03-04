class SheetMusic < ActiveRecord::Base
  has_many :arrangements


  def get_arrangements
    ars = arrangements
    if ars.count > 1
      return ars.map{|a| a.version }
    else
      return nil
    end
  end

end
