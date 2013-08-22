class AddNoteToProductasks < ActiveRecord::Migration
  def change
    add_column :productasks, :note, :text
  end
end
