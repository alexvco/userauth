require_relative 'boot'

require 'rails/all'
require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"
require "action_view/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Userauth
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.


    ##============================================================##
    ## Config action_mailer
    ##============================================================##
    config.action_mailer.perform_deliveries = true
    config.action_mailer.raise_delivery_errors = true
    config.action_mailer.default :charset => "utf-8"
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.default_url_options = { host: 'localhost:3000' }
    config.action_mailer.smtp_settings = {
      :address        => "smtp.gmail.com",
      :port           => 587,
      :authentication => :plain,
      :user_name      => "zzz@gmail.com",
      :password       => "zzz",
      :enable_starttls_auto => true
    }

  end
end
