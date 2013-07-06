module ApplicationHelper

  def body_class_name
    "#{controller_name}_#{action_name}"
  end

  def nav_link(link_text, link_path)
    class_name = current_page?(link_path) ? 'active' : ''

    content_tag(:li, :class => class_name) do
      link_to link_text, link_path
    end
  end

  def page_title
    "#{@page_title ? @page_title + " | " : ""}Surfers Field Hockey"
  end

  def meta_description
    "Huntington Beach Field Hockey Club, fondly known as SURFERS, we are a 501(c)(7) nonprofit organization promoting youth, adult and veterans Field Hockey in Orange County"
  end

end
