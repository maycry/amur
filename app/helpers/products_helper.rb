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

  def get_instock_margin
    @image_width > 346 ? w=346 : w=@image_width
    k = @image_height/@image_width.to_f
    h = w*k
    t = h-40
    "top:#{t}px"
  end
end
