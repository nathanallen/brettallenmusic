class CatalogController < ApplicationController
  def index

    @catalog = SheetMusic.all.map{|music|
      {
        title: music.title,
        subtitle: music.subtitle,
        description: music.description,
        arrangements: music.versions,
        our_price: music.arrangements.first.parts.first.price

      }
    }

  end
end
