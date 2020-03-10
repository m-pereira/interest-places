require 'rails_helper'

RSpec.describe PlacePicker, type: :service do
  describe '#call' do
    let!(:place_1) { create(:interest_place, name: 'Restalrant', x: 10, y: 5) }
    let!(:place_2) { create(:interest_place, name: 'Food Truck', x: 12, y: 6, opened: '19:00', closed: '23:50') }
    let!(:place_3) { create(:interest_place, name: 'Barber Shop', x: 27, y: 19) }
    let(:params) { { x: 5, y: 8, mts: 10, hr: '12:00' } }

    it 'returns the collection formated' do
      expect(described_class.call(params)).to eq([
        { name: place_1.name, status: 'opened' },
        { name: place_2.name, status: 'closed' }
      ])
    end
  end
end
