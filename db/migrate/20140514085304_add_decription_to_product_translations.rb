class AddDecriptionToProductTranslations < ActiveRecord::Migration
  def change
    add_column :product_translations, :description, :text
  end
end
