module ProductsHelper
  def is_empty (type)
    true
  end
  
  def get_image_size
    if @image_width > 346
      "width:346px"
    else
      "width:#{@image_width}px"
    end
  end
end
