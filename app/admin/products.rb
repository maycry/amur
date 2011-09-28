ActiveAdmin.register Product do
  menu :priority => 1

  form :partial => "form"
  
  controller do
    def new
      @product = Product.new
      @productimages = 4.times { @product.productimages.build }
    end
    
    def edit
      @product = Product.find(params[:id])
      @productimages = 4.times { @product.productimages.build }
    end
  end
  
end
