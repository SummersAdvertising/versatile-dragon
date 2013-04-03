class ProductclassesController < ApplicationController
  def index
    @productclasses = Productclass.with_translations(I18n.locale).all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @productclasses }
    end
  end

  def show
    @productclasses = Productclass.with_translations(I18n.locale).all
    @productclass = Productclass.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @productclass }
    end
  end
end
