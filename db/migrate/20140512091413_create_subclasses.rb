class CreateSubclasses < ActiveRecord::Migration
  def change
    create_table :subclasses do |t|
      t.integer :productclass_id
      t.string :name

      t.timestamps
    end
  end
end
