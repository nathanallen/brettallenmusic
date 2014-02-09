class CreateSheetMusics < ActiveRecord::Migration
  def change
    create_table :sheet_musics do |t|
      t.string :title
      t.string :subtitle
      t.text :description
      t.string :genre
      t.string :duration
      t.string :soundcloud_link

      t.timestamps
    end
  end
end
