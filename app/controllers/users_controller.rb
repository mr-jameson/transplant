class UsersController < ApplicationController
    def show
        @id = params[:id]
        @user = User.find(@id)
    end

    def edit
        @user = current_user
    end
    
    def update
        current_user.update(
            name: params[:user][:name],
            mobile: params[:user][:mobile],
            description: params[:user][:description]
        )

        if current_user.address.nil?
            current.user.create_address(
                address: params[:address][:address],
                suburb: params[:address][:suburb],
                state: params[:address][:state],
                postcode: params[:address][:postcode]
            )
        else
            current_user.address.update(
                address: params[:address][:address],
                suburb: params[:address][:suburb],
                state: params[:address][:state],
                postcode: params[:address][:postcode] 
            )
        end
        redirect_to(user_path)
    end        
end