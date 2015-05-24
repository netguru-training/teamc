require 'rails_helper'

RSpec.describe EventsController, type: :controller do

  describe '#show' do
    let(:event) { create(:event) }

    context 'user is not signed in' do
      it 'test' do
        binding.pry
      end
    end
  end

end
