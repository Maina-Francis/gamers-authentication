class SessionsController < ActionController::Base
    skip_before_action :verify_authenticity_token

    # import current_user_concern
    include CurrentUserConcern

    def create
        # find user by email and authenticate their password
        user = User.find_by(email: params[:session][:email]).try(:authenticate, params[:session][:password])

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
                status: 401
            }
        end
    end

    # Logged_In
    def logged_in
        if @current_user
        render json: {
            logged_in: true,
            user: @current_user
        }
        else
        render json: {
            logged_in: false
        }
        end
    end

    # log out
    def logout 
        reset_session
        render json: {
            status: 200,
            logged_out: true
        }
    end
end