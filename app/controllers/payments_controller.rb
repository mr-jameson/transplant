class PaymentsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:webhook]

    def success
        id = params[:plantId]
        @plant = Plant.find(id)
    end

    def webhook
        payment_id= params[:data][:object][:payment_intent]
        payment = Stripe::PaymentIntent.retrieve(payment_id)
        plant_id = payment.metadata.plant_id
        user_id = payment.metadata.user_id
        byebug

        Ledger.create(plant_id: plant_id, user_id: user_id, stripe_id: payment.id )
    end
end
