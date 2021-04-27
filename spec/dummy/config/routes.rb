Rails.application.routes.draw do
  mount TelegramChatbot::Engine => "/telegram_chatbot"
end
