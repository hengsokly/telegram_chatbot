require_dependency "telegram_chatbot/application_controller"

module TelegramChatbot
  class TelegramBotsController < ApplicationController
    before_action :set_bot, on: [:show, :upsert]

    def show
    end

    def upsert
      if @telegram_bot.update(bot_params)
        redirect_to telegram_bots_url
      else
        render :show
      end
    end

    def help
    end

    private
      def set_bot
        @telegram_bot = TelegramChatbot::TelegramBot.first || TelegramChatbot::TelegramBot.new
      end

      def bot_params
        params.require(:telegram_bot).permit(
          :token, :username, :enabled
        )
      end
  end
end
