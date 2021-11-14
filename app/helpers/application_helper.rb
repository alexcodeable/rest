module ApplicationHelper

  def current_order
    if Order.find_by_id(session[:order_id]).nil?
      Order.new
    else
      Order.find_by_id(session[:order_id])
    end
    # @current_order ||= Order.find_by_id(session[:order_id]).presence || Order.new
    # if !session[:order_id].nil?
    #   Order.find(session[:order_id])
    # else
    #   Order.new
    # end
  end
  
end
