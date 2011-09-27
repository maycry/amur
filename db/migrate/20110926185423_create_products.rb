class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string   :articul
      t.decimal  :price
      t.integer  :type_id
      t.integer  :category_id
      t.boolean  :is_active
      t.boolean  :in_stock
      t.text     :about
      t.date     :released_at   

      t.timestamps
    end
  end
end
