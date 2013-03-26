class AddMasterToAdmin < ActiveRecord::Migration
  def change
  	add_column :admins, :master, :boolean , :default => false
  end
end
