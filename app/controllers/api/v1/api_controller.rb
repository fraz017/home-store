class Api::V1::ApiController < ApplicationController
	include DeviseTokenAuth::Concerns::SetUserByToken
  respond_to :json
  before_action :ensure_json_request
 
  def ensure_json_request
    return if params[:format] == 'json' || request.headers['Accept'] =~ /json/
    render nothing: true, status: 406
  end
end
