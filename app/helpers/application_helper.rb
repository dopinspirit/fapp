module ApplicationHelper

  def form_title(page_title)

    base_title = "blmt"
    if page_title.empty?
      base_title
    else
      base_title + " | " + page_title
    end

  end

end
