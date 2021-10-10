class ApplicationController < ActionController::Base

    def authenticate_admin_user!
        unless current_user.present? && current_user.admin == true
          redirect_to root_path, alert: 'Access denied'
        end
      end
end
