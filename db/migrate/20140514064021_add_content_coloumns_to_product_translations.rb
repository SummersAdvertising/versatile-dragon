class AddContentColoumnsToProductTranslations < ActiveRecord::Migration
  def change
    add_column :product_translations, :content_point, :text
    add_column :product_translations, :content_form, :text
    add_column :product_translations, :content_wrap, :text
    add_column :product_translations, :content_wash, :text
    add_column :product_translations, :content_outro, :text
  end
end
