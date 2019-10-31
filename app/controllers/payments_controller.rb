class PaymentsController < ApplicationController
    def success
    end

    def webhook
        payment_id= params[:data][:object][:payment_intent]
        payment = Stripe::PaymentIntent.retrieve(payment_id)
        plant_id = payment.metadata.plant_id
        user_id = payment.metadata.user_id
    
        p "plant id " + plant_id
        p "user id " + user_id
    
        status 200
    end
end