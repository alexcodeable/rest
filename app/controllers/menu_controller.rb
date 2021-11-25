class MenuController < ApplicationController
  before_action :set_product, only: %i[ show ]
  before_action :set_cats


  def index
    @page = 'menu'
    @pageinfo = 'Order your favourite food from our list of menu'
    
    @q = Product.ransack(params[:q])
    @products = @q.result.includes(:category).to_a.uniq
    
    @order_item = current_order.order_items.new
  end

  def show
    @order_item = current_order.order_items.new
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  def set_cats
    @cats = Category.all.where(display: true)
  end
end
