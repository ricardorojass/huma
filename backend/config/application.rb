require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
# require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Backend
  class Application < Rails::Application
    config.load_defaults 7.0
    config.active_storage.service = :s3
    config.active_storage.service_urls_expire_in = 10.minutes
    # config.active_storage.resolve_model_to_route = :rails_storage_proxy
    config.api_only = true
    config.filter_parameters += [:image]

    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    # config.autoloader = :classic
    # puts "Rails.root, #{Rails.root}"
    # config.autoload_paths << Rails.root.join('app/controllers/concerns')
    # config.eager_load_paths << Rails.root.join('app/controllers/concerns')
  end
end
