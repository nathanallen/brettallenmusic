class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :stripe_token
      t.string :stripe_customer_id
      t.string :description
      t.integer :amount
      t.boolean :completed, default: false

      t.string :email
      
      t.string :billing_name
      t.string :billing_address_line1
      t.string :billing_address_zip
      t.string :billing_address_city
      t.string :billing_address_state
      t.string :billing_address_country

      t.string :shipping_name
      t.string :shipping_address_line1
      t.string :shipping_address_zip
      t.string :shipping_address_city
      t.string :shipping_address_state
      t.string :shipping_address_country

      t.timestamps
    end
  end
end