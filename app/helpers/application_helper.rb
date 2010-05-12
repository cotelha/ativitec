# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def flash_message
    messages = ""
    [:notice, :info, :warning, :error].each {|type|
      if flash[type]
        messages += "<div id=\"msg_#{type}\" class=\"msg_#{type}\" align=\"center\"><h1>#{flash[type]}</h1></div>"
      end
    }
    messages
  end

end
