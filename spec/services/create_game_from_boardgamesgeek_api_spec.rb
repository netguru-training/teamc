require 'rails_helper'

describe CreateGameFromBoardgamesgeekApi do
  describe "#call" do
    subject { CreateGameFromBoardgamesgeekApi.new(game_id).call }

    context "wrong id" do
      let(:game_id) { 999999 }

      it "returns no game_id error" do
        expect( subject.error ).to eq "No game with this id."
      end
    end

    context "correct id" do
      let(:game_id) { 35424 }

      it "returns self without error" do
        expect( subject.error ).to eq nil
      end
    end
  end
end