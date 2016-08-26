class Api::V1::ApiController < ApplicationController
	include DeviseTokenAuth::Concerns::SetUserByToken
  respond_to :json
  before_action :ensure_json_request
 	helper_method :current_order

  def current_order
    if current_api_v1_user.present?
      if current_api_v1_user.orders.last
    		current_api_v1_user.orders.last	
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
