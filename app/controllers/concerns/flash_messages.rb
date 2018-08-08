module FlashMessages
  extend ActiveSupport::Concern
  private

# =====================================================================================================================================================================
# MESSAGES ============================================================================================================================================================
# =====================================================================================================================================================================
  def flash_alert
    "Failed to #{action_name} #{flash_object_name}."
  end

  def flash_success
    "#{flash_object_name} successfully #{flash_action_name}."
  end

# =====================================================================================================================================================================
# LOGIC ===============================================================================================================================================================
# =====================================================================================================================================================================
  included do
    def clear_flash_messages
      flash.clear
    end

    def flash_message(message)
      if message == "alert"
        flash.now[message] = send("flash_#{message}".to_sym)
      else
        flash[message] = send("flash_#{message}".to_sym)
      end
    end

    def flash_action_name
      action_name == 'destroy' ? action_name + "ed" : action_name + "d"
    end

    def flash_object_name
      controller_name.underscore.humanize.split.map {|word| word.singularize }.join(" ")
    end
  end
end
