class HomeController < ApplicationController
  before_action :authenticate_user!, only: %i{notifications orders}
  def index
    @page = 'home'
    @pageinfo = "Welcome to fav's Restaurant"
  end

  def about
    @page = 'about'
    @pageinfo = "Know more about fav's Restaurant"
  end

  def contact
    @page = 'contact'
    @pageinfo = 'Get in touch with Us. '
  end

  def notifications
  end

  def orders
  end

  def catering
    @page = 'catering'
    @pageinfo = 'Everything catering'
  end
end
