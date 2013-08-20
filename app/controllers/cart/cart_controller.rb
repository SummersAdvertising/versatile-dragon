# encoding: UTF-8
class Cart::CartController < ApplicationController
	layout 'application'
	before_filter :count_cartitems

	def add
		@product = Product.where(:id => params[:productasklist][:product_id]).first

		if( @product )
			#write cookie
			@cartitems = cookies[:cart] ? JSON.parse(cookies[:cart]) : Hash.new

			@cartitems[params[:productasklist][:product_id]] = nil
			cookies[:cart] = @cartitems.to_json

			respond_to do |format|
				format.html { redirect_to :back, notice: "已將#{ @product.name }新增至詢價車。" }
			end
		else
			respond_to do |format|
				format.html { redirect_to :back, alert: "商品不存在。" }
			end
		end
	end

	def delete
		@cartitems = JSON.parse(cookies[:cart])
		@cartitems.delete(params[:product_id].to_s);

		cookies[:cart] = @cartitems.to_json

		respond_to do |format|
			format.html { redirect_to new_productask_path }
		end
		
	end
end