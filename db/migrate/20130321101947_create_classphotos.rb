class CreateClassphotos < ActiveRecord::Migration
  def change
    create_table :classphotos do |t|
      t.string :name
      t.string :image
      t.integer :productclass_id

      t.timestamps
    end
  end
end
