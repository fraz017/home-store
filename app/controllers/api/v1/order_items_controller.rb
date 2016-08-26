class Api::V1::OrderItemsController < Api::V1::ApiController
	before_action :authenticate_api_v1_user!
  def create
    @order = current_order
    @order_items = @order.order_items.new(order_item_params)
    @order.save
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find_by_product_id(params[:order_item][:product_id])
    @order_item.update_attributes(order_item_params)
    @order_items = @order.order_items
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find_by_product_id(params[:order_item][:product_id])
    @order_item.destroy
    @order_items = @order.order_items
  end

  def clear
    @order = current_order.destroy
    render :destroy
  end

	private
	  def order_item_params
	    params.require(:order_item).permit(:quantity, :product_id)
	  end

	  def shipping_address_params
	    params.require(:order).permit(:shipping_address => [:first_name, :last_name, :email, :mobile, :address, :pincode, :city, :state, :country, :order_id])
	  end

	  def billing_address_params
	    params.require(:order).permit(:billing_address => [:first_name, :last_name, :email, :mobile, :address, :pincode, :city, :state, :country, :order_id])
	  end
end
