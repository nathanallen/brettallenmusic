class Order < ActiveRecord::Base
  has_and_belongs_to_many :items
  alias_attribute :price, :amount

  def self.build(params)
    item = params[:item]
    customer = params[:customer]
    
    o = Order.new(
      stripe_token: params[:stripe_token],

      # TODO: ITEM NUMBERS
      description: item[:description], #? when multiple items?
      amount: item[:price],
      
      email: customer[:email],
      billing_name: customer[:billing_name],
      billing_address_line1: customer[:billing_address_line1],
      billing_address_zip: customer[:billing_address_zip],
      billing_address_city: customer[:billing_address_city],
      billing_address_state: customer[:billing_address_state],
      billing_address_country: customer[:billing_address_country],
      shipping_name: customer[:shipping_name],
      shipping_address_line1: customer[:shipping_address_line1],
      shipping_address_zip: customer[:shipping_address_zip],
      shipping_address_city: customer[:shipping_address_city],
      shipping_address_state: customer[:shipping_address_state],
      shipping_address_country: customer[:shipping_address_country],
    )
  end

end

