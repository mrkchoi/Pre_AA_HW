class ArtworksController < ApplicationController
  def index
    
    user_owned_artwork = Artwork.all.where(artist_id: params[:user_id])
    artwork_shared_with_user = Artwork.all.joins(:shared_viewers).where('artwork_shares.viewer_id = ?', params[:user_id])
    # Find all artwork by the user
    render json: user_owned_artwork + artwork_shared_with_user

    # Find all artworks shared with the user

  end

  def show
    artwork = Artwork.find(params[:id])
    render json: artwork
  end

  def create
    artwork = Artwork.new(artwork_params)
    if artwork.save
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    artwork = Artwork.update(params[:id], artwork_params)
    render json: artwork
  end

  def destroy
    artwork = Artwork.find(params[:id])
    artwork.destroy
    render json: artwork
  end

  private

  def artwork_params
    params.require(:artwork).permit(:artist_id, :title, :image_url)
  end
end