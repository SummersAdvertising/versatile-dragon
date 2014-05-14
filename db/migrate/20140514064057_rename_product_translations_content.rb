class RenameProductTranslationsContent < ActiveRecord::Migration
  def change
  	rename_column :product_translations, :content, :content_intro
  end
end
