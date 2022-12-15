class ArtworkSharesController < ApplicationController

  def index
        # params[:user_id] => "1"
    if params.has_key?(:user_id)
      @artwork_shares = ArtworkShare.find_by(viewer_id: params[:user_id])
    else
      @artwork_shares = ArtworkShare.all
    end

    render json: @artwork_shares 
  end

  def destroy
    @artworkshare = ArtworkShare.find(params[:id])

    @artworkshare.destroy
    render json: ArtworkShare.all

  end

  def create
    @artworkshare = ArtworkShare.new(artwork_share_params)
    if @artworkshare.save
      render json: @artworkshare
    else
      render json: @artworkshare.errors.full_messages, status: :unprocessable_entity 
    end
  end

private
  def artwork_share_params
    params.require(:artwork_shares).permit(:artwork_id, :viewer_id)
  end

end