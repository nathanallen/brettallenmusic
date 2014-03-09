class CatalogController < ApplicationController
  def index

    @catalog = SheetMusic.all.map{|music|
      {
        title: music.title,
        subtitle: music.subtitle,
        description: music.description,
        arrangements: music.get_arrangements,
        our_price: "50"

      }
    }

  end
end


# music.arrangements.first.parts.first.price