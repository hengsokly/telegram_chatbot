# frozen_string_literal: true

module TelegramChatbot
  class NotificationWorker
    include Sidekiq::Worker

    def perform(message, groups)
      return unless message.present? && groups.present?

      Notification.notify(message, groups)
    end
  end
end
