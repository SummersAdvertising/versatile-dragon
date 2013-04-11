class AddTranslationToProduct < ActiveRecord::Migration
	def up
		remove_column :products, :content, :name
		remove_column :productclasses, :name, :content, :frontshow
		Product.create_translation_table! :content => :text, :name => :string
		Productclass.create_translation_table! :content => :text, :name => :string, :frontshow => :string
		
	end
	
	def down
		add_column :products, :name, :string
		add_column :products, :content, :text
		add_column :productclasses, :name, :string
		add_column :productclasses, :content, :string
		add_column :productclasses, :frontshow, :string
	
		Product.drop_translation_table!
		Productclass.drop_translation_table!
	
	end
end
