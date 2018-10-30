Stripe.api_key = Rails.application.credentials.stripe[:secret_key]

unless defined? STRIPE_JS_HOST
  STRIPE_JS_HOST = 'https://js.stripe.com'
end