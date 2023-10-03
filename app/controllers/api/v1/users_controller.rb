class Api::V1::UsersController < ApplicationController
	skip_before_action :authenticate_user

  def index
      users = User.all
      render json: users, status: :ok
  end

	def create
		user = User.new(user_params)
		if user.save
			token = issue_token(user)
			user_json = serialize_user(user, token)
			render_user(user_json)
		else
			render_error(user.errors.messages, :unprocessable_entity)
		end
	end
	  
	def show
		user = User.find_by(id: params[:id])
		if user
			token = issue_token(user)
			user_json = serialize_user(user, token)
			render_user(user_json)
		else
			render_error('User not found.', :unprocessable_entity)
		end
	end

  private

  def user_params
      params.require(:user).permit(:firstName, :lastName, :email, :country, :password)
  end
	  
	def serialize_user(user, token)
		{
			data: {
				id: user.id,
				type: "users",
				attributes: {
					jwt: token,
					email: user.email,
					name: "#{user.first_name} #{user.last_name}",
					country: user.country,
					created_at: user.created_at,
					updated_at: user.updated_at
				}
			}
		}
	end
	  
	def render_user(user_json)
		render json: user_json
	end

	def render_error(message, status)
    render json: { errors: message }, status: status
  end
end