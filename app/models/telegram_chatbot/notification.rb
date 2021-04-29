module TelegramChatbot
  class Notification
    def self.bulk_notify_async(message, groups = [])
      return unless bot.present? && bot.actived?

      groups.each do |group|
        notify_async(message, group)
      end
    end

    def self.notify_async(message, group = nil)
      return if group.nil? && !group.actived?

      NotificationWorker.perform_async(message, group.id)
    end

    def self.notify(message, group_id = nil)
      return if group_id.nil?

      begin
        group = ::TelegramChatbot::ChatGroup.find(group_id)
        client.send_message(chat_id: group.chat_id, text: message, parse_mode: :HTML) if group.actived?
      rescue ActiveRecord::RecordNotFound => e
        logger.info "Find not found chat_group ID: #{group_id}"
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
