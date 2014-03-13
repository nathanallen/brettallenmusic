class CatalogController < ApplicationController
  def index

    @catalog = SheetMusic.all.map{|music|
      entry = {
        title: music.title,
        subtitle: music.subtitle,
        description: music.description
        # arrangements: music.get_arrangements,
        # our_price: "50"

      }


      if (arrangements = music.arrangements).count > 1 #multiple_arrangements
        entry["multiple_arrangements"] = arrangements.map{|a| return [a.version, a.parts.first.price] }
      elsif (parts = music.arrangements.first.parts).count > 2 #multiple_parts
        entry["multiple_parts"] = parts.map{|part| return [part.instrument, part.price] }
      else
        entry["arrangement"] = [arrangements.first.version, parts.first.price] #one_arrangement
      end      

      return entry

    }


    # @catalog = []

    # Item.all.each{|item|
    #   vendor = {vendor: item.vendor, link: item.external_purchase_link}
    #   our_price = item.price #if vendor.vendor == "BAM"

    #   part = item.part

    #   part

    #   sheet_music =

    #   title =
    #   subtitle =
    #   description =
    #   our_price =



    #   @catalog[]  


    #   title: music.title,
    #   subtitle: music.subtitle,
    #   description: music.description,
    #   arrangements: music.get_arrangements,
    #   our_price: "50"



    #   item = Item.first.part.arrangement.sheet_music
    # }


  end
end


# music.arrangements.first.parts.first.price