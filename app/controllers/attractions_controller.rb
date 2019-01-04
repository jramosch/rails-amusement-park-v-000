class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find(params[:id])
  end

  def create
    byebug
    @attraction = Attraction.create(params)
    return redirect_to '/attractions/new' unless @attraction.save
    redirect_to admin_attraction_path(@attraction)
  end

  def take_ride
    @attraction = Attraction.find(params[:id])
    ride = Ride.create(user_id: session[:user_id], attraction_id: @attraction.id)
    flash[:alert] = "#{ride.take_ride}"
    flash[:notice] = "Thanks for riding the #{@attraction.name}!"
    redirect_to '/'
  end
end
