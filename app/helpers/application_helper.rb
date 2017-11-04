module ApplicationHelper
  BASE_TITLE = 'Ecotone | OSU Cascades'.freeze

  def full_title(page_title = '')
    page_title.empty? ? BASE_TITLE : "#{page_title} | #{BASE_TITLE}"
  end

  def form_errors_for(object)
    render partial: 'shared/form_errors', locals: { object: object }
  end

  def content_for_title(title)
    provide(:title, title)
    content_for(:screen_title) { content_tag(:h1) { title } }
  end
end
