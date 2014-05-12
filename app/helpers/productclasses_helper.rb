#encoding: utf-8
module ProductclassesHelper
	def display_productclasses(productclass_active, productclasses)
		@display_content = String.new

		productclasses.each do |productclass|
			@display_content += "<li>#{ link_to(productclass.name, productclass_path(productclass, :locale => I18n.locale)) }</li>"

			if(productclass == productclass_active)
				productclass.subclasses.each do |subclass|
					@display_content += "<li>├ #{subclass.name}</li>"
				end
			end
		end

		return @display_content
	end

	def display_subclasses_products(productclass)
		@display_content = String.new

		productclass.subclasses.each do |subclass|
			@display_content += "<div>"
			@display_content += "<h3>#{subclass.name}</h3>"

			@display_content += "products"

			@display_content += "</div>"
		end

		return @display_content
	end
end
