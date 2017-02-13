class Admin::RestaurantsController < AdminController

  before_action -> { load_resource(:restaurant) }, except: :index

  def index
    @restaurants = current_user.restaurants
  end

  def new

  end

  def create
    @restaurant.attributes = permit_params(:restaurant)
    @restaurant.user = current_user
    if @restaurant.save!
      redirect_to admin_restaurants_path, notice: 'Restaurant saved succesfully'
    else
     render :new
    end
  end

  def edit
    render :new
  end

  def update
    if @restaurant.update!(permit_params(:restaurant))
      redirect_to admin_restaurants_path, notice: 'Restaurant updated succesfully'
    else
      render :edit
    end
  end

  def destroy
    @restaurant.delete
    redirect_to admin_restaurants_path, notice:  'Restaurant was deleted succesfully (bye bye)'
  end

end
