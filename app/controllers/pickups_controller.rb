class PickupsController < ApplicationController
  def create
    @pickup = Pickup.new(pickup_params)
    if @pickup.save
      flash[:success] = "Pickup created!"
    else
      flash[:danger] = "Failed to create pickup"
    end
    redirect_to root_path
  end

  def destroy
    @pickup = Pickup.find_by(id: params[:id])
    if @pickup.nil?
      flash[:notice] = "Pickup already deleted"
    else
      @pickup.destroy
      flash[:success] = "Pickup deleted"
    end
    redirect_to root_path
  end

  private

  def pickup_params
    params.require(:pickup).permit(
        :departure_time,
        :destination_id,
        :source_id
      ).merge(passenger_id: current_user.id)
  end
end
