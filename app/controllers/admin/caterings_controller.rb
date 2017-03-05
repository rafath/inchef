class Admin::CateringsController < AdminController

  before_action :load_restaurant_resource

  def index
    @caterings = Catering.all.includes(:user)
    # JSON.parse Tweet.all.to_json(include: :scores)
  end

  def new
    @user = User.new
    @user.caterings.build(restaurant_id: @restaurant.id)
  end

  def create
    @user = User.create(permit_params)
    @user.password = 'nawidelcu123'
    @user.password_confirmation = 'nawidelcu123'
    if @user.save
      redirect_to admin_restaurant_caterings_path(params[:restaurant_id]), notice: 'Catering added successfully'
    else
      render html: @user.errors.messages
    end
  end

  def update

  end

  private

  def permit_params
    params.require(:user).permit!
  end
end
