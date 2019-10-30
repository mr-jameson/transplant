class PlantsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_plant, only: [:show]
    before_action :set_user_plant, only: [:edit, :update]
    has_one_attached :image

    def index
    end

    def new
        @plant = Plant.new
    end

    def create
    end

    def show
    end

    def edit
    end

    def destroy
    end
end