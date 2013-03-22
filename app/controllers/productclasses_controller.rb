class ProductclassesController < ApplicationController
  def index
    @productclasses = Productclass.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @productclasses }
    end
  end

  def show
    @productclasses = Productclass.all
    @productclass = Productclass.find(params[:id])
    @products = @productclass.products.order('created_at DESC').all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @productclass }
    end
  end
end
