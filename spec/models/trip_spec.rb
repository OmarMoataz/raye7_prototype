require 'rails_helper'

RSpec.describe Trip, type: :model do
  it { should belong_to(:driver) }
  it { should belong_to(:source) }
  it { should belong_to(:destination) }
  it { should validate_presence_of(:driver) }
  it { should validate_presence_of(:departure_time) }

  let(:user) { build(:driver_with_trips) }

  # context "When creating trip" do
  #   it "should not have a departure_time that's in the past" do
  #     byebug
  #     expect(2).to eql(2)
  #   end
  # end
end
