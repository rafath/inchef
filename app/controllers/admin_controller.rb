class AdminController < ApplicationController
  before_action :authenticate_with_session, except: [:sign_in]

  add_breadcrumb 'Admin', '#'

  layout 'admin'

  def after_sign_in_path_for(resource)
    # if resource.is_a? User
    session[:return_to] || account_home_path
    # else
    #   super
    # end
  end

  def authenticate_with_session(path=false)
    if current_user.nil?
      session[:return_to] = path.blank? ? request.fullpath : path
      authenticate_user!
    end
  end

  def restrict_access
    if current_user.is_employee?
      redirect_to account_home_path, danger: 'Sorry! You don`t have access to this page'
    end
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  def load_resource(name)
    model = Object.const_get(name.to_s.capitalize)
    instance_variable_set("@#{name}", params[:id].present? ? model.find(params[:id]) : model.new)
  end

  def load_restaurant_resource(name)
    collection = name.to_s.pluralize # category => categories
    @restaurant = current_user.restaurant(params[:restaurant_id])
    instance_variable_set("@#{name}", params[:id].present? ?
        @restaurant.send(collection).find(params[:id])
    :
        @restaurant.send(collection).build)
  end


  def permit_params(resource)
    params.require(resource.to_sym).permit!
  end

end
