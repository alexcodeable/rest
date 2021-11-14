class CartController < ApplicationController
  def show
    @order_items = current_order.order_items
    @cart_items = @order_items
    @pageinfo = 'Cart Items'
  end
end
