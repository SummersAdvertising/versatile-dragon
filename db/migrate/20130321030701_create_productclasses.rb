class CreateProductclasses < ActiveRecord::Migration
  def change
    create_table :productclasses do |t|
      t.string :name
      t.text :content

      t.timestamps
    end
  end
end
