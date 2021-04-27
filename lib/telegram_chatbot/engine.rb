module TelegramChatbot
  class Engine < ::Rails::Engine
    isolate_namespace TelegramChatbot

    config.generators do |g|
      g.test_framework :rspec
    end
  end
end
