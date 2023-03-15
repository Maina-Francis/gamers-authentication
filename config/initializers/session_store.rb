if Rails.env == "production"
    # configure sessions to use cookies
    Rails.application.config.session_store :cookie_store, key: "_authentication_app", domain: "gamers-signup254-api.render.com"
else
    Rails.application.config.session_store :cookie_store, key: "_authentication_app"
end
