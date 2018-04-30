require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_length_of(:name).is_at_least(6) }
  it { should validate_uniqueness_of(:phone_number)}
  it { should define_enum_for(:role).with([:driver, :passenger]) }
  it { should have_many :trips }
  it { should have_many :pickups }

  let(:driver) { create(:driver_with_trips) }
  let(:passenger) { create(:passenger_with_pickups, role: "passenger") }


  context "Testing user dependent destroy" do
    it "should destroy trips along with driver destruction" do
      expect{ driver.destroy }.to change{ driver.trips.count }.by(-2)
    end

    it "should destroy pickups along with passenger deletion" do
      expect{ passenger.destroy }.to change{ passenger.pickups.count }.by(-2)
    end
  end

  
end
