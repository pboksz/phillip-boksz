module ApplicationHelper
  def icon_link(link, icon_name, options = {})
    attributes = options[:blank] ? { target: '_blank' } : {}
    link_to(link, attributes) { icon(icon_name) }
  end

  def star_rating_tag(stars)
    empty = (5 - stars).to_i
    times = stars.to_i
    half = (stars % 1) == 0.5

    icons = ''
    times.times { icons += icon('star') }
    icons += icon('star-half-o') if half
    empty.times { icons += icon('star-o') }

    icons.html_safe
  end

  def switch_project_tag(project, type)
    if project.present? && type
      link_to "##{project}", class: type do
        icon(get_icon_from_type(type))
      end
    end
  end

  private

  def get_icon_from_type(type)
    case type
      when :next; 'caret-down'
      when :prev; 'caret-up'
      else; nil
    end
  end
end
