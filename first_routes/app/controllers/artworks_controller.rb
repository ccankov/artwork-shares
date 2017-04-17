class ArtworksController < ApplicationController
  def index
    # artworks = Artwork.all
    # render json: artworks

    artworks = Artwork.joins(:artwork_shares)
    .where('artist_id = ? or viewer_id = ?', params[:user_id], params[:user_id])
    render json: artworks
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
      render(
        json: artwork.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def update
    artwork = Artwork.find(params[:id])
    if artwork.update_attributes(artwork_params)
      redirect_to artwork_url(artwork)
    else
      render(
        json: artwork.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def destroy
    artwork = Artwork.find(params[:id])
    if artwork.destroy
      render json: artwork
    else
      render(
        json: artwork.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  private

  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end
end
