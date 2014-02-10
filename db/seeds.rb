# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'CSV'

# Load title, subtitle, description and use title as hash key
path_to_file = Rails.root + 'db/seed_data/catalog-1.csv'
rows = CSV.open(path_to_file)
headers = rows.shift
headers.shift # remove 'title' from headers

music_data_hash = {}

rows.each do |row|
  title = row.shift
  pairs = headers.zip(row)
  music_data_hash[title] = {}
  pairs.each do |pair|
    music_data_hash[title][pair.first] = pair.last
  end
end

# Load all the other data into the music_data_hash
path_to_file = Rails.root + 'db/seed_data/catalog-2.csv'
moar_rows = CSV.open(path_to_file)
headers = moar_rows.shift
headers.shift

moar_data = {}

moar_rows.each_with_index do |row, index|
  title = row.shift
  pairs = headers.zip(row)
  moar_data[title] ||= []
  moar_data[title] << {}
  pairs.each do |pair|
    moar_data[title].last[pair.first] = pair.last
  end
end

music_data_hash.each_key do |title|
  music_data_hash[title]['versions'] = moar_data[title]
end

# # Populate the database

music_data_hash.each do |record|
  start = {}
  start['title'] = record.first

  record.last.each_key do |attr|
    params = start
    SheetMusic.attribute_names.each do |attr|
      if record.last[attr]
        params[attr] = record.last[attr]
      end
    end
    p SHEETMUSIC = SheetMusic.find_or_create_by(params)
  end

  music_data_hash[start['title']]['versions'].each do |record2|

    params = {}
    Arrangement.attribute_names.each do |attr|
      if record2[attr]
        params[attr] = record2[attr]
      end
    end
    p arrangement = Arrangement.create(params)

    params = {}
    Part.attribute_names.each do |attr|
      if record2[attr]
        params[attr] = record2[attr]
      end
    end
    p part = Part.create(params)

    params = {}
    Item.attribute_names.each do |attr|
      if record2[attr]
        params[attr] = record2[attr]
      end
    end
    p item = Item.create(params)
    
    SHEETMUSIC.arrangements << arrangement
    arrangement.parts << part
    part.items << item
  end
  
end