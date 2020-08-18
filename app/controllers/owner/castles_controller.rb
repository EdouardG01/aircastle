class Owner::CastlesController < ApplicationController
  def index
    @castles = Castle.where(user: current_user)
  end
end
