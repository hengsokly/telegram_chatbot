class CreateTelegramChatbotChatGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :telegram_chatbot_chat_groups do |t|
      t.string   :title
      t.string   :chat_id
      t.boolean  :actived, default: true
      t.text     :reason
      t.string   :provider
      t.string   :chat_type, default: "group"
      t.string   :bot_token
      t.string   :bot_username

      t.timestamps
    end
  end
end
