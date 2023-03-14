# whitelist specific domains using credentials and sessions

Rails.application.config.middleware.insert_before 0, Rack::Cors do
    # Localhost
    allow do
        origins "http://localhost:3000"
        resource "*", headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head], credentials: true
    end

    # app domain
    allow do
        origins "https://gamers-signup254.netlify.com"
        resource "*", headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head], credentials: true
    end
end