class Admin::SubclassesController < ApplicationController
  before_filter :require_is_admin
  layout 'admin'

  def index
  	@productclass = Productclass.with_translations(I18n.locale).find_by_id(params[:productclass_id])
  	@productclasses = Productclass.with_translations(I18n.locale).where(:parent_id => params[:productclass_id]).page(params[:page]).per(15)
  end
end