require 'rails_helper'

module TelegramChatbot
  RSpec.describe Notification, type: :model do
    let(:message) { "notify text message here" }
    let(:chat_group_1) { create(:chat_group, actived: true) }

    describe "bulk_notify_async" do
      let!(:bot) { create(:telegram_bot, actived: true) }
      let(:chat_groups) { [chat_group_1, build(:chat_group)] }
      
      it "should call notify_async twice" do
        expect(Notification).to receive(:notify_async).with(message, anything).twice

        Notification.bulk_notify_async message, chat_groups
      end
    end

    describe "notify_async" do
      it { expect {
        Notification.notify_async(message, chat_group_1)
      }.to change(NotificationWorker.jobs, :size).by(1) }
    end

    describe "notify" do
      it "should call send_message of the Telegram bot" do
        expect_any_instance_of(Telegram::Bot::Client).to receive(:send_message).with(chat_id: chat_group_1.chat_id, text: message, parse_mode: :HTML).once

        Notification.notify message, chat_group_1.id
      end
    end
  end
end
