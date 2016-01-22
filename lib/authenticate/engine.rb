module Authenticate
  class Engine < ::Rails::Engine
    # config.generators do |g|
    #   g.test_framework :rspec
    #   g.fixture_replacement :factory_girl, dir: 'spec/factories'
    # end

    # viget
    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_girl, dir: 'spec/factories'


      # g.test_framework      :rspec,        fixture: false
      # g.fixture_replacement :factory_girl, dir: 'spec/factories'
      # g.assets false
      # g.helper false
    end

  end
end
