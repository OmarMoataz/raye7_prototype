module V1
  class UsersController < ApplicationController
    before_action :authenticate_user!, only: [:show]

    def show
      redirect_to new_user_session_path unless user_signed_in?
      if current_user.role == "driver"
        @trip = Trip.new
      else
        @pickup = Pickup.new
      end
    end
  end
end
