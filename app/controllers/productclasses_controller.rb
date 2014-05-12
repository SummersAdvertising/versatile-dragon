class ProductclassesController < ApplicationController
  def index
    @productclasses = Productclass.with_translations(I18n.locale).order("productclasses.addDate DESC, productclasses.created_at DESC").all

    respond_to do |format|
      format.html
      format.json { render json: @productclasses }
    end
  end

  def show
    @productclasses = Productclass.with_translations(I18n.locale).order("productclasses.addDate DESC, productclasses.created_at DESC").all
    @productclass = Productclass.includes([:subclasses, :products]).find(params[:id])
  end
end
