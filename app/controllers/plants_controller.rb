class PlantsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_plant, only: [:show, :edit, :update, :destroy]
    before_action :set_user_plant, only: [:edit, :update]
    # investgate set_user_plant?

    def index
        @plants = Plant.all
        @address = Address.all
    end

    def new
        @plant = Plant.new
        @address = Address.all
    end

    def create
        plant_params[:price] = plant_params[:price] * 100
        @plant = current_user.plants.create(plant_params)
        
        if @plant.errors.any?
            render "new"
        else 
            redirect_to plant_path(@plant)
        end
    end

    def show
        session = Stripe::Checkout::Session.create(
            payment_method_types: ['card'],
            customer_email: current_user.email,
            line_items: [{
                name: @plant.name,
                description: @plant.description,
                amount: @plant.price,
                currency: 'aud',
                quantity: 1,
            }],
            payment_intent_data: {
                metadata: {
                    user_id: current_user.id,
                    plant_id: @plant.id
                }
            },
            success_url: "#{root_url}payments/success?userId=#{current_user.id}&plantId=#{@plant.id}",
            cancel_url: "#{root_url}plants"
        )
    
        @session_id = session.id
    end

    def update
        if @plant.update(plant_params)
            redirect_to plant_path(params[:id])
        else
            @address = Address.all
            render "edit"
        end
    end

    def edit
    end

    def destroy
    end

    private
    def plant_params
        params.require(:plant).permit(:name, :price, :description, :light, :size, :species, :pot, :postage, :image)
    end

    def set_plant
        id = params[:id]
        @plant = Plant.find(id)
    end

    def set_user_plant
        @plant = current_user.plants.find_by_id(params[:id])

        if @plant == nil
            redirect_to plants_path
        end
    end

end