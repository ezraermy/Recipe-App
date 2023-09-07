module ApplicationHelper
  def flash_alert_class(type)
    case type
    when 'error'
      'alert-warning'
    when 'success'
      'alert-success'
    else
      'alert-secondary'
    end
  end
end
