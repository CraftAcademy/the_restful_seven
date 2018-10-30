class SubscriptionsController < ApplicationController
  
  def new
    @amount = 3000
  end

  def create
    customer = Stripe::Customer.create(
      email: current_user.email,
      source: params[:stripeToken],
      description: current_user.email
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: 3000,
      description: 'Restful News Subscription',
      currency: 'EUR'
    )
    if charge[:paid]
      current_user.role = 'premium_user'
      current_user.save
      redirect_to root_path, notice: 'Welcome as a subscriber'
    end
  rescue Stripe::CardError => error
    redirect_to new_subscription_path, alert: error.message
  end
end
