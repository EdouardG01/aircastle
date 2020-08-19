class Owner::CastlesController < ApplicationController
  def index
    # @castles = Castle.where(user: current_user)
    @castles = Castle.all
  end
end
