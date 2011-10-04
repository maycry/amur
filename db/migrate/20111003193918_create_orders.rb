class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.string :phone
      t.string :bust
      t.string :waist
      t.string :heaps
      t.string :waisttofloor
      t.text   :comments

      t.timestamps
    end
  end
end
