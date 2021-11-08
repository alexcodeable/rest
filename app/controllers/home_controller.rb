class HomeController < ApplicationController
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

  def cart
    @pageinfo = 'Cart Items'
  end

  def catering
    @page = 'catering'
    @pageinfo = 'Everything catering'
  end
end
