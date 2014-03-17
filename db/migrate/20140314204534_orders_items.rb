class OrdersItems < ActiveRecord::Migration
  def change
    create_table :orders_items do |t|
      t.belongs_to :orders
      t.belongs_to :items
    end
  end
end
