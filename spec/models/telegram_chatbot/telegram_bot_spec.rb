require 'rails_helper'

module TelegramChatbot
  RSpec.describe TelegramBot, type: :model do
    it { is_expected.to have_many(:chat_groups).with_foreign_key(:bot_token).with_primary_key(:token) }

    describe "validate token and username" do
      context "enable is true" do
        let(:telegram_bot) { build(:telegram_bot, enabled: true, token: "", username: "") }

        before {
          telegram_bot.valid?
        }

        it { expect(telegram_bot.valid?).to be_falsey }

        it "requires token" do
          expect(telegram_bot.errors[:token]).not_to be_nil
        end

        it "requires username" do
          expect(telegram_bot.errors[:username]).not_to be_nil
        end
      end

      context "enable is false" do
        let(:telegram_bot) { build(:telegram_bot, enabled: false, token: "", username: "") }

        it { expect(telegram_bot.valid?).to be_truthy }
      end
    end
  end
end
