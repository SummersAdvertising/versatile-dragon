class AddStatusToProductasks < ActiveRecord::Migration
  def change
    add_column :productasks, :status, :string
  end
end
