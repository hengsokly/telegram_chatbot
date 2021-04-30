# frozen_string_literal: true

module TelegramChatbot
  class NotificationWorker
    include Sidekiq::Worker

    def perform(message, group_id = nil)
      return if !(group_id.present? && message.present?)

      Notification.notify(message, group_id)
    end
  end
end
