require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module Educationapi
  class Application < Rails::Application
    config.load_defaults 7.1
    config.autoload_lib(ignore: %w(assets tasks))
    config.api_only = true

    ##CORS
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins "http://localhost:5173" # Substitua pelo endereço do seu frontend
        resource "*",
          headers: :any,
          methods: [:get, :post, :put, :patch, :delete, :options, :head],
          credentials: true
      end
    end
  end
end
