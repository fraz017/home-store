class Api::V1::CartsController < Api::V1::ApiController
  before_action :authenticate_api_v1_user!
  def show
  	@order = current_order
  	@order_items = current_order.order_items
  end
end
