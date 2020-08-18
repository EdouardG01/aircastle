class CastlesController < ApplicationController
  def index
    @castles = Castle.all
  end

  def show
    @castle = Castle.find(params[:id])
  end

  def new
    @castle = Castle.new
  end

  def create
    @castle = Castle.new(castle_params)

    if @castle.save
      redirect_to @castle, notice: 'Castle was successfully created.'
    else
      render :new
    end
  end

  private

  def castle_params
    params.require(:castle).permit(:name, :address, :price_per_day, :description, :castle_image)
  end
end
