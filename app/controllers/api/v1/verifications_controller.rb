class Api::V1::VerificationsController < Api::V1::ApiController
  before_action :authenticate_api_v1_user!

  def generate_code
    phone_number = current_api_v1_user.mobile_number
    code = Random.rand(10000..99999).to_s
    if current_api_v1_user.is_verified == false
      current_api_v1_user.update(verification_code: code)
      s = SinchSms.send('5a262f18-2612-439b-9ac3-c9a43976b908', '05a32bmiukeovavvnyX8gQ==', "Your code is #{code}", phone_number)
      current_api_v1_user.update(verification_code: code, message_id: s["messageId"])
      render status: 200, json: {message: "A message has been sent with verification code"}.to_json
    else
      render status: 200, json: {message: "Your mobile number has already been verified"}.to_json
    end
  end
  
  def verify_code
    code = params[:code]
    verification = current_api_v1_user.where(code: code).first
    if verification.present?
      verification.update(is_verified: true)
      render status: 200, json: {verified: true}.to_json
    else
      render status: 200, json: {verified: false}.to_json
    end
  end
end
