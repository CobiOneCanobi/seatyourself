class ReservationsController < ApplicationController
  before_filter :ensure_logged_in, :load_restaurant, except: ['myreservations']

  def myreservations
    @reservations = current_user.reservations
  end

  def new
      @reservation = Reservation.new
  end


  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    @reservation.restaurant = @restaurant

    if @reservation.save
      redirect_to restaurants_path, notice: "Successfully made reservation"
    else
      render :new
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to restaurants_path
  end

  def index
    if current_user.owner == 0
       @reservations = @restaurant.reservations
    else
      @reservations = current_user.reservations
    end
  end

  # def show #might not use
  #   if current_user.owner == 0
  #     @reservations = @restaurant.reservations
  #   end
  # end

  def load_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  private
  def reservation_params
    params.require(:reservation).permit(:party_size, :time_slot)
  end
end
