TelegramChatbot::Engine.routes.draw do
  root 'telegram_bots#show'

  resource :telegram_bots, only: [:show], path: '/bot' do
    put :upsert, on: :collection
    get :help, on: :collection
  end

  # Telegram
  telegram_webhook TelegramChatbot::WebhooksController
end
