class CastlesController < ApplicationController
  def index
    @castles = Castle.all
  end
end
