class ReservationsController < ApplicationController
  before_filter :ensure_logged_in

  def new
      @reservation = Reservation.new
    end
  end

  def create
    @reservation = Reservation.create(reservation_params)

    if @reservation.save
      redirect_to restaurants_path, notice: "Successfully made reservation"
    else
      render :new
  end

  def destroy
    @reservation.destroy
    redirect_to
  end

  def index
    if current_user.owner
      @reservations = current_user.owned_restaurants.reservations #may need to add nested resources
    else
      @reservations = current_user.reservations
    end
  end

  def show #might not use
    @reservation = Reservation.find(params[:id])
  end

  private
  def reservation_params
    params.require(:reservation).permit(:party_size, :time_slot)
  end
end
