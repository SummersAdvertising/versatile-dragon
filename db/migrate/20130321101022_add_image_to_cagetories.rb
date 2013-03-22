class AddImageToCagetories < ActiveRecord::Migration
  def up
  	add_column :category_translations, :image, :string
  end
  
  def down
  	remove_column :category_translations, :image
  end
end
