module TelegramChatbot
  class ApplicationController < ::SettingsController
    protect_from_forgery with: :exception
  end
end
