class Owner::CastlesController < ApplicationController
  def index
    @castles = Castle.where(user: current_user)
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
end
