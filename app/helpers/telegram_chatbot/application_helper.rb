module TelegramChatbot
  module ApplicationHelper
    def form_check_toggle(option = {})
      disabled = option[:disabled].present? ? "disabled" : ""
      checked = option[:checked].present? ? "checked" : ""

      str = "<div class='form-check'>"
      str += "<label class='form-check-label form-check-toggle'>"
      str += "<input type='hidden' name='#{option[:name]}' value='0'/>"
      str += "<input type='checkbox' name='#{option[:name]}' #{checked} #{disabled}/>"
      str += "<span>#{option[:label]}</span>"
      str += "</label>"
      str + "</div>"
    end

    def method_missing(method, *args, &block)
      if (method.to_s.end_with?('_path') || method.to_s.end_with?('_url')) && main_app.respond_to?(method)
        main_app.send(method, *args)
      else
        super
      end
    end
  end
end
