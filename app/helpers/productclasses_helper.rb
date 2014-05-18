#encoding: utf-8
module ProductclassesHelper
	def display_productclasses(productclass_active, productclasses)
		@display_content = String.new

		productclasses.each_with_index do |productclass, index|
			@display_content += "<h4 id='left-#{index+1}'>#{ link_to(productclass.name, productclass_path(productclass, :locale => I18n.locale)) }</h4>"

			if(productclass == productclass_active)
				@display_content += "<ul>"
				productclass.subclasses.each do |subclass|
					@display_content += "<li>#{ link_to(subclass.name, productclass_subclass_path(productclass, subclass, :locale => I18n.locale)) }</li>"
				end
				@display_content += "</ul>"
			end
		end

		return @display_content
	end

	def display_subclasses_products(productclass)
		@display_content = String.new

		productclass.subclasses.each do |subclass|
			next if(subclass.products.length == 0)
			@display_content += '<div class="thumb">'
			@display_content += "<h4>#{subclass.name}</h4>"
			@display_content += '<ul class="bxslider">'

			subclass.products.each do |product|
				@display_content += "<li><a href='#{productclass_subclass_product_path(productclass, subclass, product, :locale => I18n.locale)}'> <img src='example-2.jpg'><br>
              <span>#{product.name.blank? ? "未命名" : product.name}</span></a></li>"
			end

			@display_content += "</ul></div>"
		end

		return @display_content
	end
end
