require 'rails_helper'

RSpec.describe Trip, type: :model do
  it { should belong_to(:driver) }
  it { should belong_to(:source) }
  it { should belong_to(:destination) }
  it { should validate_presence_of(:departure_time) }

  context "When creating an invalid user" do
    let(:trip) { build(:trip) }
    context "when source is invalid" do
      
    end
  end
end
