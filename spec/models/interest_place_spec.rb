require 'rails_helper'

RSpec.describe InterestPlace, type: :model do
  describe 'validations' do
    subject { build(:interest_place) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
    it { is_expected.to validate_presence_of(:x) }
    it { is_expected.to validate_presence_of(:y) }
  end
end
