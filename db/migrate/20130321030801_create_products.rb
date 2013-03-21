class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :content
      t.integer :productclass_id

      t.timestamps
    end
  end
end
