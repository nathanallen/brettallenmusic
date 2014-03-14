class SheetMusic < ActiveRecord::Base
  has_many :arrangements

  def vendor_items
    arrangements.first.parts.first.items.where("vendor != ?", "BAM")
  end

  def outside_vendors?
    !vendor_items.empty?
  end

  def multiple_arrangements?
    arrangements.count > 1
  end

  def multiple_parts?
    arrangements.first.parts.count > 2
  end

  def sample_parts
    # TODO: if multiple arrangements, return samples for each version, else
    arrangements.first.parts
  end

  def sample_recording
    soundcloud_link
  end

end
