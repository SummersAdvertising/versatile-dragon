class AddSubclassToProductclasses < ActiveRecord::Migration
  def change
    add_column :productclasses, :depth, :integer, :default => 1
    add_column :productclasses, :parent_id, :integer, :default => 0
  end
end
