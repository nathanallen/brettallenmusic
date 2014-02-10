class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :price
      t.string :format
      t.string :external_purchase_link
      t.string :vendor
      t.belongs_to :part
      
      t.timestamps
    end
  end
end
