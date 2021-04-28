$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "telegram_chatbot/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "telegram_chatbot"
  spec.version     = TelegramChatbot::VERSION
  spec.authors     = ["Sokly"]
  spec.email       = ["hengsokly23@gmail.com"]
  spec.homepage    = "https://github.com/hengsokly/telegram_chatbot"
  spec.summary     = "TelegramChatbot setting with chatgroup."
  spec.description = "TelegramChatbot setting with chatgroup."
  spec.license     = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.0.3", ">= 6.0.3.5"

  spec.add_dependency "haml"
  spec.add_dependency "haml-rails"
  spec.add_dependency "jquery-rails"
  spec.add_dependency "bootstrap"
  spec.add_dependency "simple_form"
  spec.add_dependency "sidekiq"
  spec.add_dependency "telegram-bot", "~> 0.15.3"

  spec.add_development_dependency "rspec-rails", "~> 4.0.1"
  spec.add_development_dependency "factory_bot_rails"
  spec.add_development_dependency "shoulda-matchers"

  spec.add_development_dependency "pg"
end
