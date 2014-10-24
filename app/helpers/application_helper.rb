module ApplicationHelper
  def header_active?(controller = nil, action = nil)
     return if controller && controller.to_s != params[:controller]
     return if action && action.to_s != params[:action]
    'active'
  end

  alias_method :menu_active?, :header_active?


  def render_flash_messages
    s = ''
    flash.each do |k, v|
      s << render_flash_message(message_type: k, text: v)
    end
    s.html_safe
  end

  def render_flash_message(text: '', message_type: 'info', closeable: true)
    alert_class = bootstrapify_flash_type(message_type)

    s = "<div role='alert' class=\"alert alert-#{alert_class} #{ 'alert-dismissible' if closeable } \">#{text}"
    s << "<button type=\"button\" class=\"close\" data-dismiss=\"alert\"><span aria-hidden=\"true\">&times;</span><span class=\"sr-only\">Close</span></button>" if closeable
    s << '</div>'

    s.html_safe
  end

  private

  def bootstrapify_flash_type(flash_type)
    case flash_type
    when 'alert'
    'warning'
    when 'notice'
    'success'
    when 'error'
    'danger'
    else
    'info'
    end
  end

end
