class Api::V1::UsersController < ApplicationController

  def create
    # creating a new user 
    user = User.new(user_params)

    ## assign jwt token to the user
    if user.save
      token= issue_token(user)
      render json: { user: UserSerializer.new(user) , jwt: token }
    else
      if user.errors.messages
        render json: { error: user.errors.messages } # to check for user creation validation 
      else
        render json: { error: 'User could not be created. Please Try Again later.' } # failed to create records
      end 
    end 
  end 

  private

  def user_params
    params.require(:user).permit(:firstName, :lastName, :email, :password, :country)
  end 
end 
