class PlaylistsController < ApplicationController
  def create
    render json:
  end

  def show
    render json: Playlist.find(params[:id])
  end

  def update
  end

  def destroy
  end
end
