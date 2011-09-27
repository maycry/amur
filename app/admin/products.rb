ActiveAdmin.register Product do
  menu :priority => 1

  form :partial => "form"
  
  controller do
    def new
      @product = Product.new
      @productimages = 3.times { @product.productimages.build }
    end
  end
  
end
