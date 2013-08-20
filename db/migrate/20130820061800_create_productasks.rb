class CreateProductasks < ActiveRecord::Migration
  def change
    create_table :productasks do |t|
      t.string :askername
      t.string :askertel
      t.string :askermail
      t.string :purpose

      t.timestamps
    end
  end
end
