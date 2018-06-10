Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://www.tinyhouse.exchange' # address of the frontend app
    resource '*', headers: :any, methods: [:get, :post, :options], credentials: true
  end

  allow do
    origins 'http://localhost:8080' # address of the local app
    resource '*', headers: :any, methods: [:get, :post, :options], credentials: true
  end
end
