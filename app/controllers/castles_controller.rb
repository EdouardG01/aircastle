class CastlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
        sql_query = " \
        castles.name ILIKE :query \
        OR castles.description ILIKE :query \
        OR users.first_name ILIKE :query \
        OR users.last_name ILIKE :query \
      "
        @castles = Castle.joins(:user).where(sql_query, query: "%#{params[:query]}%")
        # @users = Castle.joins(:user).where(sql_query, query: "%#{params[:query]}%")
        # @castles = Castle.all
      else
        @castles = Castle.all
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
