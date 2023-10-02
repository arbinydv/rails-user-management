class Api::V1::SessionsController < ApplicationController
  # SessionController  creates a session for our user each time they log into the site. Authorization part 
  # skip_before_action :authorized, only: [:create]  ## user will be able to signup through create methos

   def create
        ## for log in the user
       user = User.find_by(email: user_login_params[:email]) ## finding by email
       if user && user.authenticate(user_login_params[:password])  # user.authenticate ==> from bcrypt gem 
           token = issue_token(user)  # token generate
         render json: {user: UserSerializer.new(user), jwt: token}
       else
         render json: {error: 'Incorrect credentials...'}, status: 401
       end
     end

   def show
    # already logged in or not 
    if logged_in?
        render json: current_user
    else
        render json: { error: 'User not found!'}, status: 401
    end
   end

   private
   def user_login_params
    ## api call requeest body
     params.require(:session).permit(:email, :password)
   end
end
