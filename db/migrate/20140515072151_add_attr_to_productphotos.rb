class AddAttrToProductphotos < ActiveRecord::Migration
  def change
    add_column :productphotos, :description, :string
    add_column :productphotos, :img_type, :string
  end
end
