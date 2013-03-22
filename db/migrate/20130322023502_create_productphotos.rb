class CreateProductphotos < ActiveRecord::Migration
  def change
    create_table :productphotos do |t|
      t.string :name
      t.string :image
      t.integer :product_id

      t.timestamps
    end
  end
end
