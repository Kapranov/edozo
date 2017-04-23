class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :new, :edit, :update, :destroy]

  def index
    album = Album.find(params[:album_id])
    @photos = album.photos

    render :index
  end

  def show
    album = Album.find(params[:album_id])
    @photo = album.photos.find(params[:id])
    @commentable = @photo
    @comments = @commentable.comments
    @comment = Comment.new
  end

  def new
    album = Album.find(params[:album_id])
    @photo = album.photos.build
  end

  def edit
    album = Album.find(params[:album_id])
    @photo = album.photos.find(params[:id])
  end

  def create
    album = Album.find(params[:album_id])
    @photo = album.photos.new(photo_params)

    if @photo.save
      redirect_to album_photos_path, notice: 'Photo was successfully created.'
    else
      render :new
    end
  end

  def update
    album = Album.find(params[:album_id])
    @photo = album.photos.find(params[:id])

    if @photo.update(photo_params)
      redirect_to album_photos_path, notice: 'Photo was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    album = Album.find(params[:album_id])
    @photo = album.photos.find(params[:id])
    @photo.destroy

    redirect_to album_photos_url, notice: 'Photo was successfully deleted.'
  end

  private

  def set_photo
    @album = Album.find_by!(id: params[:album_id])
    @photo = @album.photos.find_by(id: params[:id])
  end

  def photo_params
    params.require(:photo).permit(:album_id, :description, :image)
  end
end
