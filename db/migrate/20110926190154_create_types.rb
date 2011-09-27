class CreateTypes < ActiveRecord::Migration
  def change
    create_table :types do |t|
      t.string :name
      t.string :alias

      t.timestamps
    end
  end
end
