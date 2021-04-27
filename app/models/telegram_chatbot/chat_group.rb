# frozen_string_literal: true

module TelegramChatbot
  class ChatGroup < ApplicationRecord
    TELEGRAM_CHAT_TYPES = %w[group supergroup]
    TELEGRAM_SUPER_GROUP = "supergroup"
    TELEGRAM_GROUP = "group"

    belongs_to :telegram_bot, primary_key: "token", foreign_key: "bot_token"

    scope :actives, -> { where(actived: true) }

    validates :title, presence: true
    validates :chat_id, presence: true
  end
end
