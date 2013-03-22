class AddOrdernumToIndexlinks < ActiveRecord::Migration
  def change
  	add_column :indexlinks, :ordernum, :integer
  end
end
