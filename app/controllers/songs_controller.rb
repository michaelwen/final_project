class SongsController < ApplicationController
  before_action :set_song, only: [:destroy]

  # GET /songs/new
  def new
    @song = Song.new
  end

  # POST /songs
  def create
    @song = Song.new(song_params)
    current_user.songs.append @song
    if @song.save
      redirect_to @song.user, notice: 'song was successfully created.'
    else
      render :new
    end
  end

  # DELETE /songs/1
  def destroy
    @song.destroy
    redirect_to @song.user, notice: 'song was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = Song.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def song_params
      params.require(:song).permit(:artist_name, :song_name)
    end
end
