class PlaylistsController < ApplicationController

  def index
    render json: Playlist.all
  end

  def create
    render json: Playlist.create(playlist_params)
  end

  def show
    render json: Playlist.find(params[:id])
  end

  def update
    @playlist = current_user.playlist
    @video = Video.create(:video => params[:video])
    @playlist.videos << @video
    render json: @playlist
  end

  def destroy
  end

  private

  def playlist_params
    params.require(:playlist).permit(:video)
  end

end
