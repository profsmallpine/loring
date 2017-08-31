class VideosController < ApplicationController
  def index
    @videos = AppData::VIDEOS
  end
end
