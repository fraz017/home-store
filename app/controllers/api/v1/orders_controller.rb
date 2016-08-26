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

  def verify
    paystackObj =  Paystack.new
    transactions = PaystackTransactions.new(paystackObj)
    result = transactions.verify(params[:transaction_reference])
    if result["data"]["status"] == "success"
      current_order.update_columns(order_status_id: 2)
      current_order.transactions.create(amount: result["data"]["amount"], transaction_date: result["data"]["transaction_date"], status: result["data"]["status"], reference: result["data"]["reference"], domain: result["data"]["domain"])
      current_api_v1_user.build_customer_info(customer_id: result["data"]["customer"]["id"], customer_code: result["data"]["customer"]["customer_code"], first_name: result["data"]["customer"]["first_name"], last_name: result["data"]["customer"]["last_name"], email: result["data"]["customer"]["email"], authorization_code: result["data"]["authorization"]["authorization_code"])
      render json: {success: true, verified: true}
    else
      render json: {success: true, verified: false}
    end  
  end

  private
	  def shipping_address_params
	    params.require(:order).permit({:shipping_address => [:first_name, :last_name, :email, :mobile, :address, :pincode, :city, :state, :country, :order_id]})
	  end

	  def billing_address_params
	    params.require(:order).permit({:billing_address => [:first_name, :last_name, :email, :mobile, :address, :pincode, :city, :state, :country, :order_id]})
	  end
end
