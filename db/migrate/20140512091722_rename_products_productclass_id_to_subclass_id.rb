class RenameProductsProductclassIdToSubclassId < ActiveRecord::Migration
  def change
  	rename_column :products, :productclass_id, :subclass_id
  end
end
