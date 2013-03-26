class AddFontcolorToIndexlinks < ActiveRecord::Migration
  def change
  	add_column :indexlinks, :fontcolor, :string
  end
end
