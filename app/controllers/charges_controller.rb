class ChargesController < ApplicationController

  def new
  end

  def create    
    order = Order.build(params)

    customer = Stripe::Customer.create(
      :email => order.email,
      :card  => order.stripe_token
    )

    order.stripe_customer_id = customer.id

    charge = Stripe::Charge.create(
      :customer    => order.stripe_customer_id,
      :amount      => order.amount,
      :description => order.description,
      :currency    => 'usd'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
    #aborted order...
  else
    order.save
  end
  
end
