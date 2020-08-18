class PagesController < ApplicationController
  def home
    @castles = Castle.first(8)
  end
end
