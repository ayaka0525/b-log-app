require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BLogApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    #環境変数の設定
    if Rails.env.development? || Rails.env.test?
      Bundler.require(*Rails.groups)
      Dotenv::Railtie.load
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    #デフォルトを日本語にする
    config.i18n.default_locale = :ja
  end
end
