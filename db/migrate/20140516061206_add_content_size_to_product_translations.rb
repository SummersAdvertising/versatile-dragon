class AddContentSizeToProductTranslations < ActiveRecord::Migration
  def change
    add_column :product_translations, :content_size, :text
  end
end
