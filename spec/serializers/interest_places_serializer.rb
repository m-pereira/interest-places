require 'rails_helper'

RSpec.describe InterestPlaceSerializer, type: :serializer do
  let(:interest_place) { create(:interest_place) }
  let(:serializer) { described_class.new(user) }
  let(:serialization) { ActiveModelSerializers::Adapter.create(serializer) }
  
  subject { JSON.parse(serialization.to_json) }

  it 'returns a serialized hash' do
    serialized_place = { 
      "name"=> interest_place.name,
      "x"=> interest_place.x,
      "y"=> interest_place.y,
      "opened"=> interest_place.opened,
      "closed"=> interest_place.closed
    }

    is_expected.to eq(serialized_user) 
  end
end
