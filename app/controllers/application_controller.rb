class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:mobile, :description, address_attributes: [:address, :state, :suburb, :postcode]])
    end 
  
  private

    # Overwriting the sign_out redirect path method
    def after_sign_out_path_for(resource_or_scope)
      log_out_path
    end
end
