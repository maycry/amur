ActiveAdmin.register Order do
  index do
    column :id
    column :product_id
    column :phone
    column :created_at
    default_actions
  end
end
