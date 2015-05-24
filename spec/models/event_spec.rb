require 'rails_helper'

describe Event, type: :model do
  it { validate_uniqueness_of(:name) }

  describe '#owner?' do
    let(:event) { create(:event) }

    context 'is owner' do
      let(:user) { event.owner }

      it "returns true" do
        expect(event.owner?(user)).to eq true
      end

    end

    context 'is not owner' do
      let(:user) {create(:user)}

      it "returns false" do
        expect(event.owner?(user)).to eq false
      end

    end
  end
end
