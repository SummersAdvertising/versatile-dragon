class AddIsCoverToProductphotos < ActiveRecord::Migration
  def change
    add_column :productphotos, :is_cover, :boolean, :default => false
  end
end
