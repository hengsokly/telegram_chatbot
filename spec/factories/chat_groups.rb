# frozen_string_literal: true

FactoryBot.define do
  factory :chat_group, class: "telegram_chatbot/chat_group" do
    title { "test 1" }
    chat_id { "123456" }
    chat_type { "group" }
    actived { true }
    telegram_bot
  end
end
