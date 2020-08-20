class CastlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @castles = Castle.all
    @castles = Castle.geocoded # returns flats with coordinates

    @markers = @castles.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
    end
  end

  def show
    @castle = Castle.find(params[:id])
    @reservation = Reservation.new
  end

  def new
    @castle = Castle.new
  end

  def create
    @castle = Castle.new(castle_params)
    @castle.user = current_user
    if @castle.save!
      redirect_to @castle, notice: 'Castle was successfully created.'
    else
      render :new
    end
  end

  private

  def castle_params
    params.require(:castle).permit(:name, :address, :price_per_day, :description, :photo)
  end
end
