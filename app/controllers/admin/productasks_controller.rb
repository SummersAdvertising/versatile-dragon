#encoding: utf-8
class Admin::ProductasksController < ApplicationController
  before_filter :require_is_admin
  layout 'admin'

  def index
    @productasks = Productask.order("created_at desc").all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @productask = Productask.find(params[:id])
  end

  def destroy
    @productask = Productask.find(params[:id])
    @productask.destroy

    respond_to do |format|
      format.html { redirect_to admin_productasks_path(params[:locale]) }
    end
    
  end

  def changeStatus
    @productask = Productask.find(params[:id])
    @productask.update_attributes(params[:productask])
    
    respond_to do |format|
      format.html { redirect_to admin_productask_path(params[:locale], params[:id]) }
    end
  end
  
end
