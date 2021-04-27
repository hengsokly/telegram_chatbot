require 'rails_helper'

module TelegramChatbot
  RSpec.describe ChatGroup, type: :model do
    it { is_expected.to belong_to(:telegram_bot).with_foreign_key(:bot_token).with_primary_key(:token) }
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:chat_id) }
    it { is_expected.to validate_presence_of(:chat_type) }
    it { is_expected.to validate_inclusion_of(:chat_type).in_array(ChatGroup::TELEGRAM_CHAT_TYPES) }
  end
end
