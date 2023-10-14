class ApplicationController < ActionController::API
  before_action :authenticate_user

  private

  def authenticate_user
    authorization_header = request.headers['Authorization'] ## from Postman
    token = authorization_header.split(" ").last if authorization_header
    decoded_token = JsonWebToken.decode(token)
    @user_id = decoded_token[:user_id]
    render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
  rescue JWT::VerificationError
    invalid_token
  rescue JWT::DecodeError
    decode_error
  end

  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find_by(id: @user_id)
  end

  def invalid_token
    render json: { invalid_token: 'Invalid token' }
  end

  def decode_error
    render json: { decode_error: 'Decode error' }
  end
end
