class CreateProductasklists < ActiveRecord::Migration
  def change
    create_table :productasklists do |t|
      t.integer :productask_id
      t.integer :product_id
      t.string :productname

      t.timestamps
    end
  end
end
