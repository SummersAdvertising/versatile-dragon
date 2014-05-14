class DropCategories < ActiveRecord::Migration
  def change
  	#remove_index(:category_translations, :name => 'index_category_translations_on_category_id')
  	#remove_index(:category_translations, :name => 'index_category_translations_on_locale')
  	
  	drop_table :categories
  	drop_table :category_translations
  end
end
