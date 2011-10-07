ActiveAdmin.register Page do
  index do
    column :id
    column :name
    default_actions
  end
  
  form do |f|
    f.inputs do
      f.input :name
      f.input :alias
      f.input :is_active
      f.input :content
      f.input :illustration
    end
    f.buttons
  end
  
end
