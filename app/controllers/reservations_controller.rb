class ReservationsController < ApplicationController
  before_filter :load_restaurant, :ensure_logged_in

  def new
      @reservation = Reservation.new
  end


  def create
    @reservation = Reservation.create(reservation_params)
    @reservation.user = current_user
    @reservation.restaurant = @restaurant

    if @reservation.save
      redirect_to restaurants_path, notice: "Successfully made reservation"
    else
      render :new
    end
  end

  def destroy
    @reservation.destroy
    redirect_to
  end

  def index
    if current_user.owner == 0
      @reservations = current_user.owned_restaurants.reservations #may need to add nested resources
    else
      @reservations = current_user.reservations
    end
  end

  # def show #might not use
  #   @reservation = Reservation.find(params[:id])
  # end
  def load_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  private
  def reservation_params
    params.require(:reservation).permit(:party_size, :time_slot)
  end
end
