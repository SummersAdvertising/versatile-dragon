class AddPicCountCacheToProducts < ActiveRecord::Migration
  def change
    add_column :products, :detail_count, :integer, :default => 0
    add_column :products, :color_count, :integer, :default => 0
    add_column :products, :point_count, :integer, :default => 0
  end
end
