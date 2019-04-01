class TracksController < ApplicationController
  def new
    @track = Track.new
    @album = Album.find_by(id: params[:id])

    render :new
  end

  def create
    track = Track.new(track_params)

    if track.save
      redirect_to album_url(params[:track][:album_id])
    else
      render json: 'Track info invalid!'
    end
  end

  def edit
    @track = Track.find_by(id: params[:id])
    render :edit
  end

  def update
    track = Track.find_by(id: params[:id])
    track.update_attributes(track_params)
    redirect_to album_url(params[:track][:album_id])
  end

  def show
    @track = Track.find(params[:id])
    render :show
  end

  def destroy
    track = Track.find_by(id: params[:id])
    album = Album.find_by(id: track.album_id)

    track.destroy

    redirect_to album_url(album)
  end


  private

  def track_params
    params.require(:track).permit(:album_id, :title, :ord, :track_type, :lyrics)
  end
end

