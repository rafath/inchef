class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  add_flash_types :danger, :success

  layout :layout_by_resource

  protected

  def layout_by_resource
    devise_controller? ? 'admin' : 'application'
  end

end
