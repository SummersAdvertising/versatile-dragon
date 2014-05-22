#encoding: utf-8
module ProductsHelper
	def show_product_bread(product)
		@breads = "#{product.subclass.productclass.name} > #{product.subclass.name} > #{product.name.blank? ? "未命名" : product.name}"
	end
end