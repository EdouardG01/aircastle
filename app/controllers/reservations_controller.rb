class ReservationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :new]

  def index
    @reservations = Reservation.where(user: current_user)
  end

  def new
    @castle = Castle.find(params[:castle_id])
    @reservation = Reservation.new
  end

  def create
    @castle = Castle.find(params[:castle_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.castle = @castle

    # Probleme : on peut avoir une date de 0 jours
    @reservation.total_price = @castle.price_per_day * (@reservation.ending_date - @reservation.starting_date).to_i

    @reservation.user = current_user

    if @reservation.save
      redirect_to reservations_path
    else
      render :new
    end
  end

  def accept
    @reservation = Reservation.find(params[:id])
    @reservation.status = "accepted"
    @reservation.save!
    redirect_to reservations_path
  end

  def decline
    @reservation = Reservation.find(params[:id])
    @reservation.status = "declined"
    @reservation.save!
    redirect_to reservations_path
  end

  private

  def reservation_params
    params.require(:reservation).permit(:starting_date, :ending_date)
  end
end
