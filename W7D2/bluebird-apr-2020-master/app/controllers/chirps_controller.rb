class ChirpsController < ApplicationController
  def index 
    chirps = Chirp.where(author_id: params[:user_id]) #pulling the wildcard from the route 
    render json: chirps
  end

  def show 
    chirp = Chirp.find(params[:id])
    render json: chirp
  end
end
