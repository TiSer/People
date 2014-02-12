class PhotosController < ApplicationController
  before_filter :prepare_person
  # GET /photos
  # GET /photos.json
  def index
    @photos = @person.photos

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @photos }
    end
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
    @photo = Photo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @photo }
    end
  end

  # GET /photos/new
  # GET /photos/new.json
  def new
    @photo = Photo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @photo }
    end
  end

  # GET /photos/1/edit
  def edit
    @photo = Photo.find(params[:id])
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = @person.photos.new(params[:photo])

    respond_to do |format|
      if @photo.save
        format.html { redirect_to person_photos_path(@person), notice: 'Photo was successfully created.' }
        format.json { render json: @photo, status: :created, location: @photo }
      else
        format.html { render action: "new" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /photos/1
  # PUT /photos/1.json
  def update
    @photo = Photo.find(params[:id])

    respond_to do |format|
      if @photo.update_attributes(params[:photo])
        format.html { redirect_to person_photos_path(@person), notice: 'Photo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to person_photos_path(@person) }
      format.json { head :no_content }
    end
  end

  def destroy_multiple
    Photo.destroy(params[:photos]) if params[:photos]
    
    respond_to do |format|
      format.html { redirect_to person_photos_path(@person) }
      format.json { head :no_content }
    end
  end


  private
    def prepare_person
      @person = Person.find(params[:person_id]) 
    end

end
