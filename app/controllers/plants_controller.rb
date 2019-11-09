class PlantsController < ApplicationController
    before_action :translate_params, only: [:create, :update]
    before_action :authenticate_user!, only: [:show, :edit, :new, :update, :destroy]
    before_action :set_plant, only: [:show, :edit, :update, :destroy]
    before_action :set_user_plant, only: [:edit, :update]

    def index
        @address = Address.all

        # create array which containts only available plants. Achieved by subtracting any plant added to the ledger table after purchase.
        plants_available = Plant.all.ids - Ledger.pluck(:plant_id)
        @plants = Plant.where(id: plants_available)
    end

    def new
        # set variables to allow creation of new plant
        @plant = Plant.new
        @address = Address.all
    end

    def create
        @plant = Plant.new(plant_params)
        @plant.user_id = current_user.id        
        if @plant.save
            redirect_to plant_path(@plant)
        else 
            render "new"
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
        set_plant.destroy
        redirect_to plants_path
    end

    private
    def plant_params
        # validate which attributes are allowed for plant
        params.require(:plant).permit(:name, :price, :description, :light, :size, :species, :pot, :postage, :image)
    end

    def set_plant
        # define current plant
        id = params[:id]
        @plant = Plant.find(id)
    end

    def set_user_plant
        @plant = current_user.plants.find_by_id(params[:id])

        if @plant == nil
            redirect_to plants_path
        end
    end

    def translate_params
        # method for converting price from dollars in view to cents in database
        params[:plant][:price] = (params[:plant][:price].to_f * 100).to_i
    end

end
