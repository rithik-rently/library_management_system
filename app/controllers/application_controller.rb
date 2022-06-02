class ApplicationController < ActionController::Base
    before_action :configure_sign_up_params, if: :devise_controller?
    protect_from_forgery with: :null_session

    
    
      def configure_sign_up_params
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:user_type, :contact])
        
      end
    
end