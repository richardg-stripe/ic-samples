# frozen_string_literal: true

require 'stripe'

puts 'Starting!'

Stripe.api_key = 'sk_test_eZXiEVaSHdorIQiYW7SWGCUb00wqFkeYAH'

# payment_method_id = 'pm_card_visa'
payment_method_id = 'pm_card_chargeDeclinedInsufficientFunds'

customer = Stripe::Customer.create

Stripe::PaymentIntent.create({
                               "amount": 14_736,
                               "currency": 'EUR',
                               "metadata": {
                                 "order_id": 'Booking #229469: 97213'
                               },
                               "payment_method": payment_method_id,
                               "customer": customer.id,
                               "setup_future_usage": 'off_session',
                               "confirm": 'true'
                             })

Stripe::PaymentIntent.create({
                               amount: 123,
                               currency: 'EUR',
                               customer: customer.id,
                               payment_method: payment_method_id,
                               off_session: true,
                               confirm: true
                             })
