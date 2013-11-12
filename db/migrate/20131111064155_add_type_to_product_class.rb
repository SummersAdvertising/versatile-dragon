class AddTypeToProductClass < ActiveRecord::Migration
  def change
  	add_column :productclasses, :class_type, :string
  end
end
