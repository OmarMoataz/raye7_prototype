module V1
  class TripsController < ApplicationController
    def create
      @trip = Trip.new(trip_params)
      if @trip.save
        flash[:success] = "Trip created!"
      else
        flash[:danger] = "Failed to create trip"
      end
      redirect_to root_path
      # @trip = Trip.create!(trip_params)
    end

    def destroy
      @trip = Trip.find_by(id: params[:id])
      if @trip.nil?
        flash[:notice] = "Trip already deleted"
      else
        @trip.destroy
        flash[:success] = "Trip deleted"
      end
      redirect_to root_path
    end

    private

    def trip_params
      params.require(:trip).permit(
        :departure_time,
        :number_seats,
        :destination_id,
        :source_id
        ).merge(driver_id: current_user.id)
    end
  end
end
