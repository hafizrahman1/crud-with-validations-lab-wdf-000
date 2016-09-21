class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]

  def new
    @song = Song.new
  end

  def index
    @songs = Song.all
  end

  def show
  end

  def edit
  end

  def create
    @song = Song.new(post_params)
    if @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def update
   if  @song.update(post_params)
      redirect_to song_path(@song)
   else
     render :edit
   end
  end

  def destroy
    @song.destroy
    redirect_to songs_path
  end

  private

  def set_song
    @song = Song.find(params[:id])
  end

  def post_params
    params.require(:song).permit(:title, :artist_name, :release_year, :relaeased, :genre)
  end
end
