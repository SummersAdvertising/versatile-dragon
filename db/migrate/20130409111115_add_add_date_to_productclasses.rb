class AddAddDateToProductclasses < ActiveRecord::Migration
  def change
  	add_column :productclasses, :addDate, :date
  end
end
