class VideosController < ApplicationController
  caches_page :index, :show

  def index
    @videos = AppData::VIDEOS
  end

  def show
    @video = AppData::VIDEOS.values.flatten.find { |vid| vid[:id] == params[:id].to_i }
    return redirect_to '/404' if @video.blank?
  end
end
