class AddFrontshowToProductclasses < ActiveRecord::Migration
  def change
  	add_column :productclasses, :frontshow, :boolean, :default => false
  end
end
