class CastlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @castles = Castle.geocoded

    if params[:query].present?
      sql_query = " \
      castles.name ILIKE :query \
      OR castles.description ILIKE :query \
      OR users.first_name ILIKE :query \
      OR users.last_name ILIKE :query \
      "
      @castles = @castles.joins(:user).where(sql_query, query: "%#{params[:query]}%")
    end
    @markers = @castles.map do |castle|
      {
        lat: castle.latitude,
        lng: castle.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { castle: castle }),
        image_url: helpers.asset_url('marker.png')
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
      redirect_to @castle, notice: 'Le château a été créer avec succès.'
    else
      render :new
    end
  end

  private

  def castle_params
    params.require(:castle).permit(:name, :address, :price_per_day, :description, :photo)
  end
end
