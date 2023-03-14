class SessionsController < ActionController::Base
    def create
        # find user by email and authenticate their password
        user = User.find_by(email: params["user"]["email"]).try(:authenticate, params["user"]["password"])

        # if user === true, store user_id in their browser as cookies
        if user
            session[:user_id] = user.id

            render json: {
                status: :created,
                logged_in: true,
                user: user
            }
        
            # if user isn't authenticated, render status 401
        else
            render json: {
                status : 401
            }
        end
    end
end