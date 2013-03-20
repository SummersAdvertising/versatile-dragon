class CreateIndexlinks < ActiveRecord::Migration
  def change
    create_table :indexlinks do |t|
      t.string :title
      t.string :image
      t.string :link

      t.timestamps
    end
  end
end
