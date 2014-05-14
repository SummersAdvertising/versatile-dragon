class SubclassesController < ApplicationController
  def show
    @productclasses = Productclass.with_translations(I18n.locale).order("productclasses.addDate DESC, productclasses.created_at DESC").all
    @subclass = Subclass.includes(:productclass).includes(:products).find(params[:id])
  end
end