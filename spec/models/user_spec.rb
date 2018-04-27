require 'rails_helper'

RSpec.describe User, type: :model do

  it { should validate_length_of(:name).is_at_least(6) }
  it { should validate_uniqueness_of(:phone_number)}
  it { should define_enum_for(:role).with([:driver, :passenger]) }
end
