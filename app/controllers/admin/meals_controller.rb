class Admin::MealsController < AdminController

  before_action -> { load_restaurant_resource(:meal) }, except: :index

  def index
    @meals = current_user.restaurant(params[:restaurant_id]).meals
  end

  def new
    5.times { @meal.ingredients.build }
  end

  def create
    @meal.attributes = permit_params(:meal)
    if @meal.save
      redirect_to admin_restaurant_meals_path(params[:restaurant_id]), notice: 'Category added successfully'
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @meal.update(permit_params(:meal))
      redirect_to admin_restaurant_categories_path(@restaurant), notice: 'Category updated successfully'
    else
      render :edit
    end

  end

  def destroy
    if @meal.delete
      redirect_to admin_restaurant_categories_path(@restaurant), notice: 'Category was deleted successfully'
    end
  end


end
