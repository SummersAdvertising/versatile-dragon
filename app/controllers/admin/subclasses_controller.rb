#encoding: utf-8
class Admin::SubclassesController < ApplicationController
  before_filter :require_is_admin
  before_filter :find_productclass, :except => [:destroy]
  layout 'admin'

  def create
  	@subclass = @productclass.subclasses.new({:name => params[:subclass][:name]})

  	respond_to do |format|
  		unless(@subclass.save)
  			flash[:alert] = "新增子分類失敗，請重新輸入"
  		end

  		format.html{ redirect_to :back }
  	end
  end

  def destroy
  	@subclass = Subclass.find_by_id(params[:id])
  	@subclass.destroy if @subclass

  	respond_to do |format|
  		format.html{ redirect_to :back, notict: "子分類已刪除" }
  	end
  end

  def find_productclass
  	@productclass = Productclass.find_by_id(params[:productclass_id])
  end
end