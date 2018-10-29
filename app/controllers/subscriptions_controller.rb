class SubscriptionsController < ApplicationController
  def new
  end

  def create
    customer = Stripe::Customer.create(
      email: current_user.email,
      source: params[:stripeToken],
      description: current_user.email
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: 1000,
      description: 'Premium subscription'
      currency: 'sek'
    )
  end
end
