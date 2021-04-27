# frozen_string_literal: true

FactoryBot.define do
  factory :telegram_bot, class: "telegram_chatbot/telegram_bot" do
    token    { SecureRandom.hex(8) }
    username { "bot_name" }
  end
end
