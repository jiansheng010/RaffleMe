# 4/16/2019 - Added Faye-Rails Middleware and Extension - Tom Paoloni

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RaffleMe
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2


    # 04/14/19 - Added Faye config code - Tom Paoloni

    # Code for setting up Faye, the websocket server
    Faye::WebSocket.load_adapter('thin')
    config.middleware.use FayeRails::Middleware, mount: '/faye', timeout: 3600 do

      # Hooks up RoomSocketController to the /rooms channel
      map '/rooms' => RoomSocketController

      # Extends Faye, adding a faye client id to messages that
      # entrants send when joining a room
      class CIDExtension
        def incoming(message, callback)
          if message['channel'] == '/rooms'
            message['data']['cid'] = message['clientId']
          end
          callback.call(message)
        end
      end
      add_extension(CIDExtension.new)
    end

    config.generators.javascript_engine = :js
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.action_view.embed_authenticity_token_in_remote_forms = true
    config.secret_key_base = 'blipblapblup'
  end
end