class CreateTelegramChatbotTelegramBots < ActiveRecord::Migration[6.0]
  def change
    create_table :telegram_chatbot_telegram_bots do |t|
      t.string  :token
      t.string  :username
      t.boolean :enabled, default: false
      t.boolean :actived, default: false

      t.timestamps
    end
  end
end
