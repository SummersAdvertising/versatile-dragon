class AddAttrsToProductask < ActiveRecord::Migration
  def change
    add_column :productasks, :askercompany, :string
    add_column :productasks, :country, :string
    add_column :productasks, :subject, :string
    add_column :productasks, :askamount, :string
  end
end
