module ApplicationHelper
  def icon_link(link, icon_type, icon_name, options = {})
    attributes = options[:blank] ? { target: '_blank' } : {}
    link_to(link, attributes) { icon(icon_type, icon_name) }
  end

  def star_rating_tag(stars)
    return icon('fas', 'question-circle').html_safe if stars.to_f == 0

    empty = (5 - stars).to_i
    times = stars.to_i
    half = (stars % 1) == 0.5

    icons = ''
    times.times { icons += icon('fas', 'star') }
    icons += icon('fas', 'star-half-alt') if half
    empty.times { icons += icon('far', 'star') }

    icons.html_safe
  end

  def switch_project_tag(project, type)
    link_to "##{project}", class: type do
      icon('fas', get_icon_from_type(type))
    end
  end

  private

  def get_icon_from_type(type)
    return 'caret-down' if type == :next
    return 'caret-up' if type == :prev

    nil
  end
end
