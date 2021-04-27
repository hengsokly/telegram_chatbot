module TelegramChatbot
  class Notification
    def self.notify_async(message, groups=[])
      return unless bot.present? && bot.actived?

      NotificationWorker.perform_async(message, groups)
    end

    def self.notify(message, groups=[])
      groups.each do |group|
        client.send_message(chat_id: group.chat_id, text: message, parse_mode: :HTML)
      rescue ::Telegram::Bot::Forbidden => e
        group.update(actived: false, reason: e)
      end
    end

    private
      def self.client
        ::Telegram::Bot::Client.new(bot.token, bot.username)
      end

      def self.bot
        ::TelegramChatbot::TelegramBot.first
      end
  end
end
