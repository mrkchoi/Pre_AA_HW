class AlbumsController < ApplicationController
  before_action :authenticate_user

  def new
    @album = Album.new
    render :new
  end

  def create
    album = Album.new(album_params)

    # fail
    if album.save
      redirect_to band_url(params[:album][:band_id])
    elsif album.errors.full_messages
      flash.now[:errors] = ["Invalid album details"]
      @params = params[:album][:band_id]
      render :new
    end
  end

  def show
    @album = Album.find_by(id: params[:id])
    @band = Band.find_by(id: params[:band_id])
    render :show
  end

  def edit
    @album = Album.find_by(id: params[:id])
    render :edit
  end

  def update
    album = Album.find_by(id: params[:id])
    if !album.update_attributes(album_params)
      flash[:album_edit_errors] = ["Invalid album details. Edit not saved."]
    end

    redirect_to album_url(album)
  end

  def destroy
    @album = Album.find_by(id: params[:id])
    band_id = @album.band_id
    @album.destroy
    redirect_to band_url(band_id)
  end

  private

  def album_params
    params.require(:album).permit(:title, :band_id, :year, :album_type)
  end
end

