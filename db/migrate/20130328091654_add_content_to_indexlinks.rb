class AddContentToIndexlinks < ActiveRecord::Migration
  def change
  	add_column :indexlinks, :content, :text
  end
end
