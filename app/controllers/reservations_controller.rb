class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
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

    # Attention : modifier quand on s'occupera des users
    @reservation.user = User.find(1)

    if @reservation.save
      redirect_to reservations_path
    else
      render :new
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:starting_date, :ending_date)
  end
end
