class RestaurantsController < ApplicationController
  def new
    if current_user.owner == 0
      @restaurant = Restaurant.new
    else
      redirect_to restaurants_path
    end
  end

  def create
    @restaurant = Restaurant.create(restaurant_params)
    @restaurant.owner_id = current_user.id

    if @restaurant.save
      redirect_to restaurants_path
    else
      render :new
    end
  end

  # def update
  #   @restaurant = Restaurant.find(params[:id])

  #   if @restaurant.update_attributes(restaurant_params)
  #     redirect_to restaurant_path(@restaurant)
  #   else
  #     render :edit
  #   end

  # end

  # def edit
  #   if current_user.owner
  #     @restaurant = Restaurant.find(params[:id])
  #   else
  #     redirect_to restaurants_path
  #   end

  # end

  # def destroy
  #   @restaurant = Restaurant.find(params[:id])
  #   @restaurant.destroy
  #   redirect_to restaurants_path
  # end

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def mine
    if current_user.owner == 0
     @restaurants = current_user.restaurants
   else
    redirect_to restaurants_path
   end
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_num, :summary, :hours_of_operation, :price_range, :category_id)
  end
end
