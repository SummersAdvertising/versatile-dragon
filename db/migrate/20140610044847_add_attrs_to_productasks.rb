class AddAttrsToProductasks < ActiveRecord::Migration
  def change
  	add_column :productasks, :purpose_customize, :text
  	add_column :productasks, :purpose_other, :text
  end
end
