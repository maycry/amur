class AddAliasToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :alias, :string
  end
end
