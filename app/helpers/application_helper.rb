module ApplicationHelper

  def body_class_name
    "#{controller_name}_#{action_name}"
  end

end
