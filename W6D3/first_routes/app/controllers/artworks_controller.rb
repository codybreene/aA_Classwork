class ArtworksController < ApplicationController

  def index
    owned = Artwork.where(artist_id: params[:user_id])
    shared_with = Artwork.joins(:shared_viewers).where(artwork_shares: {viewer_id: params[:user_id]})
    render json: owned + shared_with
  end

  def create
    artwork = Artwork.new(artwork_params)
  
    if artwork.save  
      redirect_to artwork_url(artwork)
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    render json: Artwork.find(params[:id])
  end 

  def update
    artwork = Artwork.find(params[:id])
    artwork.update(artwork_params)
    if artwork.save
      redirect_to artwork_url(artwork)
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end    
  end

  def destroy
    artwork = Artwork.find_by(id: params[:id])
    if artwork
      artwork.destroy
      render json: artwork
    else
      render json: ["artwork #{params[:id]} doesn't exist"], status: :not_found
    end
  end

  private

  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id, :user_id)
  end 

end