class RegistrationsController < ApplicationController::Base

def create 
    # create new user
    user = User.create!(
        name: params["user"]["name"],
        email: params["user"]["email"],
        password: params["user"]["password"],
        password_confirmation: params["user"]["password_confirmation"]
    )

    if user
        session[:user_id] = user.id
        render json: {
            status: :created,
            user: user
        }
    
    else
        render json: {
            status: 500,
            error: "Unprocessable entity"
        }
    end
end
end