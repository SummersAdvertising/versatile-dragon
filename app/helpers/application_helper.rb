module ApplicationHelper
	def get_path(product)
		@path = String.new 
		if product.cover
			@cover = product.cover
			@path = "/uploads/Productphoto/#{product.id}/thumb_#{@cover.id}-#{@cover.name}"
		end		
	end
end
