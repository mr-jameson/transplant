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
        @plant = current_user.plants.create(plant_params)
        
        if @plant.errors.any?
            render "new"
        else 
            redirect_to plant_path(@plant)
        end
    end

    def show
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
        @milkshake = current_user.plants.find_by_id(params[:id])

        if @plant == nil
            redirect_to plants_path
        end
    end

end