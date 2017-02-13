class Admin::CategoriesController < AdminController

  before_action -> { load_restaurant_resource(:category) }, except: :index

  def index
    @categories = current_user.restaurant(params[:restaurant_id]).categories
  end

  def new

  end

  def create
    @category.attributes = permit_params(:category)
    if @category.save
      redirect_to admin_restaurant_categories_path(params[:restaurant_id]), notice: 'Category added succesfully'
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @category.update(permit_params(:category))
      redirect_to admin_restaurant_categories_path(@restaurant), notice: 'Category updated succesfully'
    else
      render :edit
    end

  end

  def destroy
    if @category.delete
      redirect_to admin_restaurant_categories_path(@restaurant), notice: 'Category was deleted successfully'
    end
  end

end
