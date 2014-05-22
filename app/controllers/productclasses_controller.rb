class ProductclassesController < ApplicationController
  def index
    @productclass = Productclass.with_translations(I18n.locale).order("productclasses.addDate DESC, productclasses.created_at DESC").limit(1).first

    respond_to do |format|
      if(@productclass)
        format.html { redirect_to productclass_path(@productclass, :locale => params[:locale]) }
      else
        format.html
      end
    end
  end

  def show
    @productclasses = Productclass.with_translations(I18n.locale).order("productclasses.addDate DESC, productclasses.created_at DESC").all
    @productclass = Productclass.includes([:subclasses, :products => :cover ]).find(params[:id])
  end
end
