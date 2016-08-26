class Api::V1::OrdersController < Api::V1::ApiController
  before_action :authenticate_api_v1_user!
  def index
  	@orders = current_api_v1_user.orders
  end

  def add_address
  	sa = current_order.build_shipping_address(shipping_address_params[:shipping_address])
  	sa.save
  	ba = current_order.build_billing_address(billing_address_params[:billing_address])
  	ba.save
  	@order = current_order
  end

  private
	  def shipping_address_params
	    params.require(:order).permit({:shipping_address => [:first_name, :last_name, :email, :mobile, :address, :pincode, :city, :state, :country, :order_id]})
	  end

	  def billing_address_params
	    params.require(:order).permit({:billing_address => [:first_name, :last_name, :email, :mobile, :address, :pincode, :city, :state, :country, :order_id]})
	  end
end
