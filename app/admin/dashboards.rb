ActiveAdmin::Dashboards.build do

  # Define your dashboard sections here. Each block will be
  # rendered on the dashboard in the context of the view. So just
  # return the content which you would like to display.
  
  # == Simple Dashboard Section
  # Here is an example of a simple dashboard section
  #
  #   section "Recent Posts" do
  #     ul do
  #       Post.recent(5).collect do |post|
  #         li link_to(post.title, admin_post_path(post))
  #       end
  #     end
  #   end
  section "Recent Products" do
    table_for Product.order("released_at desc").limit(5) do
      column "Image" do |product|
        image_tag product.productimages.first.image.url(:thumb), :height => "50px" if product.productimages.first !=nil
      end
      column :name do |product|
        link_to product.articul, [:admin, product]
      end
      column :released_at
    end
    strong { link_to "View All Products", admin_products_path }
  end

  section "Recent Orders" do
    table_for Order.order("created_at desc").limit(5) do
      column :phone
      column :name
      column :created_at
    end
    strong { link_to "View All Orders", admin_orders_path }
  end
  
  # == Render Partial Section
  # The block is rendered within the context of the view, so you can
  # easily render a partial rather than build content in ruby.
  #
  #   section "Recent Posts" do
  #     div do
  #       render 'recent_posts' # => this will render /app/views/admin/dashboard/_recent_posts.html.erb
  #     end
  #   end
  
  # == Section Ordering
  # The dashboard sections are ordered by a given priority from top left to
  # bottom right. The default priority is 10. By giving a section numerically lower
  # priority it will be sorted higher. For example:
  #
  #   section "Recent Posts", :priority => 10
  #   section "Recent User", :priority => 1
  #
  # Will render the "Recent Users" then the "Recent Posts" sections on the dashboard.

end
