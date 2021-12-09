class DashController < ApplicationController
  layout "dashboard"

  def index
  end

  def notice
  end

  def transactions
  end

  def customers
  end

  def add_staff
  end

  def add_product
    @product = Product.new
  end

  def orders
  end

  def view_products
    @products = Product.all
  end

  def staffs
  end

end
