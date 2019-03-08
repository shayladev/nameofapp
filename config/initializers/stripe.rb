if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_6COhJAye9rW59wyn4fiXyUQH',
    secret_key: 'sk_test_JrCFT3Sp1QrahXMvw1pxb9pU'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
