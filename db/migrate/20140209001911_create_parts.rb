class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
      t.string :instrument
      t.string :scribd_sample_link
      t.belongs_to :arrangement

      t.timestamps
    end
  end
end
