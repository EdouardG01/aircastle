class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @castles = Castle.first(8)
  end
end
