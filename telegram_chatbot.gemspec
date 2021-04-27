$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "telegram_chatbot/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "telegram_chatbot"
  spec.version     = TelegramChatbot::VERSION
  spec.authors     = ["Sokly"]
  spec.email       = ["hengsokly23@gmail.com"]
  spec.homepage    = ""
  spec.summary     = "Summary of TelegramChatbot."
  spec.description = "Description of TelegramChatbot."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

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

  spec.add_development_dependency "pg"
end
