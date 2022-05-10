module ApplicationHelper
  BASE_TITLE = 'Ecotone | OSU-Cascades'.freeze

  def full_title(page_title = '')
    page_title.empty? ? BASE_TITLE : "#{page_title} | #{BASE_TITLE}"
  end

  def form_errors_for(object)
    object.photo.purge if object.photo.attached?
    render partial: 'shared/form_errors', locals: { object: object }
  end

  def content_for_title(title)
    provide(:title, title)
    content_for(:screen_title) { content_tag(:h1, class: 'center') { title } }
  end

  def photo(entity, idx = 0)
    if entity.photo.attached?
      entity.photo[idx]
    else
      'missing.png'
    end
  end

  def last_updated(entity)
    if entity.respond_to? 'user'
      "Last updated #{entity.updated_string} by #{link_to(entity.user)}".html_safe
    else
      "Last updated #{entity.updated_string}"
    end
  end

  def nutrient_table_data(sample, nutrient)
    amount = sample.nutrients.find{ |n| n.name == nutrient}&.amount
    level = sample.nutrients.find{ |n| n.name == nutrient}&.level
    if amount.nil? || (level.include? 'not present')
      "#{level}"
    else
      "#{amount} (#{level})"
    end
  end
end
