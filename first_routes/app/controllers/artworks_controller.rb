class ArtworksController < ApplicationController

  def index
    @artworks = User.all
    render json: @artworks
  end

  def create
    @artwork = Artwork.new(artwork_params)

    if @artwork.save
      render json: @artwork
    else
      render json: @artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @artwork = Artwork.find(param[:id])
    @artwork.destroy
    render json: Artwork.all
  end

  def update
    @artwork = Artwork.find(param[:id])
    if @artwork.update(artwork_params)
      render json: @artwork
    else
      render json: @artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    @artwork = Artwork.find(param[:id])
    render json: @artwork
  end


private
  def artwork_params
    params.require(:artwork).permit(:artist_id)
  end
end