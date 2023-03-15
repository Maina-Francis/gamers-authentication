class ApplicationController < ActionController::Base

    # skip authentification before users are created to deactivate CSRF token
    skip_before_action :verify_authenticity_token
end
