module ApplicationHelper
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
end
