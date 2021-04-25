module TelegramChatbot
  class ChatGroup < ApplicationRecord
    TELEGRAM_CHAT_TYPES = %w[group supergroup]
    TELEGRAM_SUPER_GROUP = "supergroup"
    TELEGRAM_GROUP = "group"
  end
end
