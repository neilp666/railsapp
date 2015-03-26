class ChargesController < ApplicationController
  
def create
  # Amount in cents


  customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :card  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => params[:amount],
    :description => 'Open Cinema',
    :currency    => 'gbp'
  )

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to charges_path
end
end

