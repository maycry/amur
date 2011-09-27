class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name
      t.text :content
      t.boolean :is_active
      t.string :alias

      t.timestamps
    end
  end
end
