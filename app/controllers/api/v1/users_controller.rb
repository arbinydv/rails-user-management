class Api::V1::UsersController < ApplicationController
  def index
      users = User.all
      render json: users, status: :ok
  end

  def create
      user = User.new(user_params)
      if user.save
        token = issue_token(user)
        ## building API response body
        user_json = {
            jwt: token,
            email: user.email,
            name: "#{user.first_name} #{user.last_name}",
            country: user.country,
            created_at: user.created_at,
            updated_at: user.updated_at
          }
        # Build the response data
        response_data = {
            data: {
                id: user.id,
                type: "users",
                attributes: user_json
            }
        }
        render json: response_data
      
      else
          if user.errors.messages
              render json: {error: user.errors.messages}
          else
              render json: {error: "User could not be created. Please try again."}
          end
      end
  end

  def show
      user = User.find(params[:id])
      if user
          render json: user, serializer: UserSerializer
      else
          render json: {error: "User not found."}
      end
  end

  private

  def user_params
      params.require(:user).permit(:firstName, :lastName, :email, :country, :password)
      #  :password is permit from postman which is then handled by password_digest
  end
end
