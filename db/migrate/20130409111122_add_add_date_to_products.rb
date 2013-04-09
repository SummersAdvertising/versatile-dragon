class AddAddDateToProducts < ActiveRecord::Migration
  def change
  	add_column :products, :addDate, :date
  end
end
