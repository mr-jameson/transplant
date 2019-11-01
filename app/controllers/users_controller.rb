class UsersController < ApplicationController
    def show
        @id = params[:id]
        @user = User.find(@id)
    end

    def edit
        @user = User.all
    end
    
    def update
        @user = User.all
    end
end