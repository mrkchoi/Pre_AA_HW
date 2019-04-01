class AlbumsController < ApplicationController
  def new
    @album = Album.new
    render :new
  end

  def create
    album = Album.new(album_params)

    if album.save
      redirect_to band_url(params[:album][:band_id])
    else
      render json: album.errors.full_messages
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
    album.update_attributes(album_params)

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
    params.require(:album).permit(:title, :band_id, :year, :studio_album)
  end
end

