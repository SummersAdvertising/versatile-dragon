class AddCoverIdToProducts < ActiveRecord::Migration
  def change
    add_column :products, :cover_id, :integer
  end
end
