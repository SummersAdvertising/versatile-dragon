# encoding: UTF-8
class Cart::CartController < ApplicationController
	layout 'application'
	before_filter :count_cartitems

	def add
		@product = Product.find_by_id(params[:product_id])

		if(@product)
			#write cookie
			@cart = cookies[:cart] ? JSON.parse(cookies[:cart]) : Hash.new

			if(@cart[params[:locale]].blank?)
				@cart[params[:locale]] = Array.new
			end

			respond_to do |format|
				if(@cart[params[:locale]].include?(@product.id))
					flash[:notice] = "#{ @product.name } 已經加入過了。"
				else
					@cart[params[:locale]].push(@product.id)
					flash[:notice] =  "已將 #{ @product.name } 新增至詢價車。"
				end

				cookies[:cart] = @cart.to_json
				
				format.html { redirect_to :back }
			end
		else
			respond_to do |format|
				format.html { redirect_to :back, alert: "商品不存在。" }
			end
		end
	end

	def delete
		@cartitems = JSON.parse(cookies[:cart])
		@cartitems[params[:locale]].delete(params[:product_id].to_i);

		cookies[:cart] = @cartitems.to_json

		respond_to do |format|
			format.html { redirect_to new_productask_path }
		end
		
	end
end