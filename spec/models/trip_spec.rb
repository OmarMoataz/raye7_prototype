require 'rails_helper'

RSpec.describe Trip, type: :model do
  it { should belong_to(:driver) }
  it { should belong_to(:source) }
  it { should belong_to(:destination) }
  it { should validate_presence_of(:departure_time) }
  it { should validate_presence_of(:number_seats) }

  context "When creating an invalid user" do
    let(:user) { create(:user, role: "passenger") }
    let(:trip) { build(:trip) }

    context "testing departure_time_cannot_be_in_the_past" do
      context "when time is in the past" do
        it "doesn't create the trip" do
          trip.departure_time = 10.hours.ago
          expect { trip.save }.not_to change{ Trip.count }
        end
      end

      context "when time is in the future" do
        it "creates the trip" do
          trip.departure_time = Time.now
          expect { trip.save }.to change{ Trip.count }.by(1)
        end
      end
    end

    context "testing user_is_a_driver" do
      context "when user is a passenger" do
        it "doesn't create the trip" do
          trip.driver_id = user.id
          expect{ trip.save }.not_to change { Trip.count }
        end
      end

      context "when user is a driver" do
        it "create the trip" do
        #trip is valid from factory
        expect{ trip.save }.to change { Trip.count }.by(1)
      end
    end
  end
end
end
