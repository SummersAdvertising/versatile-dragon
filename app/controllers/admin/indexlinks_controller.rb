class Admin::IndexlinksController < ApplicationController
  before_filter :require_is_admin
  layout 'admin'

  def index
    @indexlinks = Indexlink.with_translations(I18n.locale).order('ordernum').page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @indexlinks }
    end
  end

  def show
    @indexlink = Indexlink.with_translations(I18n.locale).find_by_id(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @indexlink }
    end
  end

  def new
    @indexlink = Indexlink.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @indexlink }
    end
  end

  def edit
    @indexlink = Indexlink.with_translations(I18n.locale).find_by_id(params[:id])
  end

  def create
    @indexlink = Indexlink.new(params[:indexlink])
    
    respond_to do |format|
      if @indexlink.save
        format.html { redirect_to admin_indexlink_path(@indexlink, :locale => I18n.locale), notice: 'Indexlink was successfully created.' }
        format.json { render json: @indexlink, status: :created, location: @indexlink }
      else
        format.html { render action: "new" }
        format.json { render json: @indexlink.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @indexlink = Indexlink.find(params[:id])

    respond_to do |format|
      if @indexlink.update_attributes(params[:indexlink])
        format.html { redirect_to admin_indexlink_path(@indexlink, :locale => I18n.locale), notice: 'Indexlink was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @indexlink.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @indexlink = Indexlink.find(params[:id])
    @indexlink.destroy

    respond_to do |format|
      format.html { redirect_to admin_indexlinks_path }
      format.json { head :no_content }
    end
  end
end
