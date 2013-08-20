#encoding: utf-8
class Admin::ProductasksController < ApplicationController
  before_filter :require_is_admin
  layout 'admin'

  def index
    @productasks = Productask.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @productask = Productask.find(params[:id])
  end

  def changeStatus
    @productask = Productask.find(params[:id])
    @productask.update_attributes({ :status => ( @productask.status == "未處理" ? "已處理" : "未處理" ) })
    
    respond_to do |format|
      format.html { redirect_to admin_productask_path(params[:locale], params[:id]) }
    end
  end
  
end
