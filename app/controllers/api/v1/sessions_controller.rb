class Api::V1::SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: [:create]

  def signin
    user = User.find_by(email: session_params[:email])  ## when user tries to sign in it comes here first to create a new session
    if user && user.authenticate(session_params[:password])  # user.authenticate ==> from bcrypt gem 
        token = JsonWebToken.encode(user_id: user.id) 
        user_json = {
        jwt: token,
        email: user.email,
        name: "#{user.first_name} #{user.last_name}",
        country: user.country,
        created_at: user.created_at,
        updated_at: user.updated_at}
        response_data = {
        data: {
            id: user.id,
            type: "users",
            attributes: user_json
        }}
      render json: response_data, status: :ok
    else
      render json: {error: 'Incorrect Email or Password'}, status: :unauthorized
    end
  end
  def show
    if logged_in?
        render json: current_user
    else
        render json: { error: 'User not found!'}, status: :unauthorized
    end
  end

  private
  def session_params
    params.require(:auth).permit(:email, :password)
  end
end