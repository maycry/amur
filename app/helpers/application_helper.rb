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
    
    if url_parts[1].split("?")==url_parts[1]
      url_parts[1]
    else
      url = url_parts[1].split("?")
      url[0]
    end  
  end
  
  def current_articul
    current_url = request.url
    url_parts = current_url.split("/")
    url_parts.slice!(0..2);
    parts_count = url_parts.size
    url_parts[2]
  end

end
