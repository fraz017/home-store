class Api::V1::ApiController < ApplicationController
	include DeviseTokenAuth::Concerns::SetUserByToken
  respond_to :json
  before_action :ensure_json_request
 	helper_method :current_order

  def current_order
    if current_api_v1_user.present?
      order = current_api_v1_user.orders.where(order_status_id: 1).last
      if order.present?
    		order	
	    else
	      current_api_v1_user.orders.create
	    end
	  end
  end

  def ensure_json_request
    return if params[:format] == 'json' || request.headers['Accept'] =~ /json/
    render nothing: true, status: 406
  end
end
