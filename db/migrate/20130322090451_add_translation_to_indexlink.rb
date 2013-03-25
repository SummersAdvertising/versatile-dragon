class AddTranslationToIndexlink < ActiveRecord::Migration
	def up		
		remove_column :indexlinks, :image
		remove_column :indexlinks, :title
		remove_column :indexlinks, :link
		Indexlink.create_translation_table! :image => :string, :title => :string, :link => :string
	end
	def down
		add_column :indexlinks, :image, :string
		add_column :indexlinks, :title, :string
		add_column :indexlinks, :link, :string
		Indexlink.drop_translation_table!
	end
end
