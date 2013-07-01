class PhotosController < ApplicationController
  before_filter :authenticate_user!
  
  def new
    @photo = current_user.albums.where(:id => params[:album_id]).first.photos.new
    redirect_to root_path, :flash => {:notice => "Record not found."} if @photo.blank?
  end

  def create
    # first check if album is available
    album = current_user.albums.where(:id => params[:photo][:album_id]).first
    if album.present?
      @photo = album.photos.new(params[:photo])
      if @photo.save
        flash[:notice] = "Successfully created photo."
        redirect_to @photo.album
      else
        render :action => 'new'
      end
    else
      redirect_to root_path, :flash => {:notice => "Error while creating a photo"}
    end
  end

  def edit
    @photo = current_user.photos.where(:id => params[:id]).first
    redirect_to root_path, :flash => {:notice => "Record not found."} if @photo.blank?
  end

  def update
    photo = current_user.photos.find(params[:id])
    if photo.present? and photo.update_attributes(params[:photo])
      flash[:notice] = "Successfully updated photo."
      redirect_to photo.album
    else
      render :action => 'edit'
    end
  end

  def destroy
    photo = current_user.photos.where(:id => params[:id]).first
    if photo.try(:destroy)
      flash[:notice] = "Successfully destroyed photo"
      redirect_to photo.album
    else
      flash[:notice] = "Could'nt find photo with ID #{params[:id]}"
      redirect_to root_url
    end
  end
end
