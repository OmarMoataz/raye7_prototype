require 'rails_helper'

RSpec.describe Place, type: :model do
  it { should validate_uniqueness_of(:longitude).scoped_to(:latitude) }
  it { should validate_uniqueness_of(:name) }

end
