#encoding: utf-8
class ProductasksController < ApplicationController
  def new
    if(cookies[:cart] && cookies[:cart].length > 0)
      @checkItems = JSON.parse(cookies[:cart])
      @askItems = checkItem(@checkItems)
    end

    @productask = Productask.new
    
  end
  def create
    if(params[:productask][:purpose])
      @purpose = String.new

      params[:productask][:purpose].each do |purpose|
        @purpose += purpose + ", "
      end

      params[:productask][:purpose] = @purpose
    end

    @productask = Productask.new(params[:productask])
    @productask.status = "未處理"
    
    if(@productask.save)
      @checkItems = JSON.parse(cookies[:cart])
      @askItems = checkItem(@checkItems)

      @askItems.each do |askItem|
        @askItem = @productask.productasklists.new({ :product_id => askItem[:id], :productname => askItem[:name] })
        @askItem.save
      end

      respond_to do |format|
        cookies[:cart] = nil

        format.html { redirect_to new_productask_path, notice: "已送出您的詢價單。"}
        format.json { render json: @productask }
      end

    else
      if(cookies[:cart] && cookies[:cart].length > 0)
        @checkItems = JSON.parse(cookies[:cart])
        @askItems = checkItem(@checkItems)
      end

      respond_to do |format|
        format.html { render action: "new"}
        format.json { render json: @productask.errors }
      end
    end

  end
end