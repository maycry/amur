module ApplicationHelper
  def current_type
    current_url = request.url
    url_parts = current_url.split("/")
    url_parts.slice!(0..2);
    parts_count = url_parts.size
    url_parts[0]
  end
  
  def current_category
    current_url = request.url
    url_parts = current_url.split("/")
    url_parts.slice!(0..2);
    parts_count = url_parts.size
    url_parts[1]
  end
  
  def current_articul
    current_url = request.url
    url_parts = current_url.split("/")
    url_parts.slice!(0..2);
    parts_count = url_parts.size
    url_parts[2]
  end

end
