require "rails_helper"

RSpec.describe "Trip requests", :type => :request do
  let(:driver) { create(:user) }
  let(:source) { create(:place) }
  let(:destination) { create(:place) }
  let(:trip) { attributes_for(:trip, driver_id: driver.id, destination_id: destination.id, source_id: source.id) }
  

  context "Testing Trip#create request" do
    context "Authenticated user" do
      before { sign_in(driver) }

      it "creates trip" do
        sign_in(driver)
        expect{ post trips_path, params: { trip: trip } }.to change{ Trip.count }.by(1)
      end
    end

    context "unauthenticated user" do
      it "doesn't create trip" do
        expect{ post trips_path, params: { trip: trip } }.not_to change{ Trip.count }
      end
    end
  end
end