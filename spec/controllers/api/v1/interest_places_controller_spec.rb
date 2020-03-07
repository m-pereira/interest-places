require 'rails_helper'

RSpec.describe Api::V1::InterestPlacesController, type: :controller do

  describe "GET #index" do
    it "returns http ok" do
      get :index

      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST #create" do
    context 'when successfully' do
      subject { post :create, params: { interest_place: attributes_for(:interest_place) } }

      it "returns http created" do
        subject

        expect(response).to have_http_status(:created)
      end

      it 'adds the interest_place' do
        expect{ subject }.to change(InterestPlace, :count).by(1)
      end
    end

    context 'when failed' do
      subject { 
        post :create, params: { 
          interest_place: { 
            name: nil,
            x: 17,
            y: 13,
            opened: '07:00',
            closed: '18:00'
          }
        }
      }

      it 'returns http unprocessable_entity' do
        subject

        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns instance errors' do
        subject

        expect(response.body).to match(/can\'t be blank/)
      end

      it 'does not addthe interest_place' do
        expect{ subject }.not_to change(InterestPlace, :count)
      end
    end
  end

  describe "PUT #update" do
    let(:interest_place) { create(:interest_place) }
  
    context 'when successfully' do

      subject { put :update, params: { id: interest_place.id, interest_place: { name: 'Restaurante da Zezé' } } }

      it "returns http ok" do
        subject

        expect(response).to have_http_status(:ok)
      end

      it 'updates the interest_place' do
        subject
        interest_place.reload

        expect(interest_place.name).to eq('Restaurante da Zezé')
      end
    end

    context 'when failed' do
      subject { put :update, params: { id: interest_place.id, interest_place: { name: nil } } }

      it 'returns http unprocessable_entity' do
        subject

        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'does not update the interest_place' do
        subject
        interest_place.reload

        expect(interest_place.name).not_to be_nil
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:interest_place) { create(:interest_place) }

    subject { delete :destroy, params: { id: interest_place.id } }

    it "returns http success" do
      subject

      expect(response).to have_http_status(:ok)
    end

    it 'deletes the interest_place' do
      expect{ subject }.to change(InterestPlace, :count).by(-1)
    end
  end

  describe 'GET search' do
    context 'when valid params' do
      subject { get :search, params: { search: { x: 12, y: 10, mts: 10, hr: '12:00' } } }

      it 'does not render the params error message' do
        subject

        expect(response.body).not_to match(
          /Search params is incorrect, it must be like: { x: 1, y: 2, mts: 10, hr: '12:00' }/
        )
      end

      it 'calls QueryGenerator' do
        allow(QueryGenerator).to receive(:call)

        expect(QueryGenerator).to receive(:call)

        subject
      end
    end

    context 'when invalid params' do
      subject { get :search, params: { search: {
        y: 10,
        mts: 10,
        hr: '12:00' 
      } } }

      it 'returns http unprocessable_entity' do
        subject

        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns the message' do
        subject

        expect(response.body).to match(
          /Search params is incorrect, it must be like: { x: 1, y: 2, mts: 10, hr: '12:00' }/
        )
      end
    end
  end
end
