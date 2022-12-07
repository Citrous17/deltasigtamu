require 'stripe'
require 'sinatra'

# This is your test secret API key.
Stripe.api_key = 'sk_test_51MBYesEPrLGFY3WnenM1BWSLneFwbJVPJ5gLrrcHMhF0SThRqW2hgFjDJhWvGrDU4tm3B4dMBJpirQ73jOSQIwei00TC2LqM0M'

set :static, true
set :port, 4242

YOUR_DOMAIN = 'http://localhost:4242/'

post '/create-checkout-session' do
  content_type 'application/json'
  session = Stripe::Checkout::Session.create({
    billing_address_collection: 'required',
    shipping_address_collection: {
      allowed_countries: ['US'],
    },
    line_items: [{
      price: 'price_1MBZp1EPrLGFY3WnNeFhwc1g',
      quantity: 1,
    }],
    mode: 'payment',
    success_url: YOUR_DOMAIN + 'success?session_id={CHECKOUT_SESSION_ID}',
    cancel_url: YOUR_DOMAIN + 'cancel',
    automatic_tax: {enabled: true},
  })
  redirect session.url, 303
end

post '/create-checkout-session/dues' do
  content_type 'application/json'
  session = Stripe::Checkout::Session.create({
    billing_address_collection: 'required',
    shipping_address_collection: {
      allowed_countries: ['US'],
    },
    line_items: [{
      price: 'price_1MBwL0EPrLGFY3WnkL7fr9mB',
      quantity: 1,
    }],
    mode: 'payment',
    success_url: YOUR_DOMAIN + 'success?session_id={CHECKOUT_SESSION_ID}',
    cancel_url: YOUR_DOMAIN + 'cancel',
    automatic_tax: {enabled: true},
  })
  redirect session.url, 303
end