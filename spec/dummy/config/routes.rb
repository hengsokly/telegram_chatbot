Rails.application.routes.draw do
  root "home#index"

  mount TelegramChatbot::Engine => "/telegram_chatbot"
end
