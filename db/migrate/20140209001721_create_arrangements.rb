class CreateArrangements < ActiveRecord::Migration
  def change
    create_table :arrangements do |t|
      t.string :version
      t.string :instrumentation
      t.belongs_to :sheet_music
      t.timestamps
    end
  end
end
