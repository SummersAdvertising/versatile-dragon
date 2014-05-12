class Admin::ProductclassesController < ApplicationController
  before_filter :require_is_admin
  layout 'admin'

  def index
    @productclasses = Productclass.with_translations(I18n.locale).includes(:subclasses).order("productclasses.addDate DESC, productclasses.created_at DESC").page(params[:page]).per(15)
    @subclass = Subclass.new
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @productclasses }
    end
  end

  def show
    
    @productclass = Productclass.with_translations(I18n.locale).find_by_id(params[:id])
        
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @productclass }
    end
  end

  def new
    @productclass = Productclass.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @productclass }
    end
  end

  def edit
    @productclass = Productclass.with_translations(I18n.locale).find_by_id(params[:id])

    @photo = Classphoto.new
  end

  #create photo
  def createPhoto
    @productclass = Productclass.find(params[:productclass_id])
    @photo = @productclass.classphotos.new(params[:classphoto])

    respond_to do |format|
      if @photo.save
        format.json { render json: @photo, status: :created, location: @photo }
        format.js
      else
        format.json { render json: @photo.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def destroyPhoto
    @photo = Classphoto.find(params[:id])
    @photopath = "public/uploads/Classphoto/"+ @photo.productclass_id.to_s + "/" + @photo.id.to_s + "-" + @photo.name

    if(!File.exist?(@photopath))
      @photopath = "public/uploads/Classphoto/"+ @photo.productclass_id.to_s + "/" + @photo.name
      if(File.exist?(@photopath))
        File.delete(@photopath)
      end
    else
      File.delete(@photopath)
    end
    
    
    @photo.destroy

    respond_to do |format|
          format.js
          format.json { head :no_content }
      end
  end

  def create
    @productclass = Productclass.new(params[:productclass])
    @productclass.frontshow = false

    respond_to do |format|
      if @productclass.save
        format.html { redirect_to edit_admin_productclass_path(@productclass, :locale => I18n.locale), notice: 'Productclass was successfully created.' }
        format.json { render json: @productclass, status: :created, location: @productclass }
      else
        format.html { render action: "new" }
        format.json { render json: @productclass.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @productclass = Productclass.find(params[:id])

    respond_to do |format|
      if @productclass.update_attributes(params[:productclass])
        format.html { render action: "show" }
        format.json { render json: @productclass }
      else
        format.html { render action: "show" }
        format.json { render json: @productclass.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @productclass = Productclass.find(params[:id])
    @productclass.destroy

    respond_to do |format|
      format.html { redirect_to admin_productclasses_path }
      format.json { head :no_content }
    end
  end
end
