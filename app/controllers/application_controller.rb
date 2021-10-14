class ApplicationController < ActionController::Base

  def authenticate_admin_user!
    unless current_user.present? && current_user.admin == true
      redirect_to root_path, alert: 'Access denied'
    end
  end


  def current_order
    if current_user
      order = Order.find_or_create_by(user_id: current_user.id, status: 0)
    end
  end
end
