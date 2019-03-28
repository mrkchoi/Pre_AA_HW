class ArtworksharesController < ApplicationController
  def create
    artwork_share = ArtworkShare.new(artworkshares_params)

    if artwork_share.save
      render json: artwork_share
    else
      render json: artwork_share.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    artwork_share = ArtworkShare.find(params[:id])
    artwork_share.destroy
    render json: artwork_share
  end

  private

  def artworkshares_params
    params.require(:artwork_shares).permit(:artwork_id, :viewer_id)
  end
end