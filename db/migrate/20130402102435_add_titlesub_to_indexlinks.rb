class AddTitlesubToIndexlinks < ActiveRecord::Migration
  def change
  	add_column :indexlinks, :titlesub, :string
  end
end
