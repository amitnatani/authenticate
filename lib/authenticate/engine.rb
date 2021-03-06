require 'authenticate'
require 'rails'

module Authenticate
  #
  # Authenticate Rails engine.
  # Filter password, token, from spewing out.
  #
  class Engine < ::Rails::Engine
    initializer 'authenticate.filter' do |app|
      app.config.filter_parameters += [:password, :token]
    end

    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
    end
  end
end
