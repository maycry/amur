ActiveAdmin.register Article do
  index do
    column :id
    column :name
    column :created_at
    default_actions
  end
end
