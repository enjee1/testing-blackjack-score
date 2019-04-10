require "spec_helper"

describe Hand do
  # '♦', '♣', '♠', '♥'

  let(:two_face_cards_hand) { Hand.new([Card.new("♦","K"), Card.new("♥","J")]) }
  let(:two_standard_cards_hand) { Hand.new([Card.new("♣",5), Card.new("♠",8)]) }
  let(:winning_hand_with_ace) { Hand.new([Card.new("♥", "A"), Card.new("♦",10)])}
  let(:face_cards_with_ace) { Hand.new([Card.new("♠", "A"), Card.new("♠", "K"),
    Card.new("♥", "Q")]) }

  describe "#calculate_hand" do
    it "returns the sum of two face cards that aren't aces" do
      expect(two_face_cards_hand.calculate_hand).to eq(20)
    end

    it "returns the sum of two non-face cards" do
      expect(two_standard_cards_hand.calculate_hand).to eq(13)
    end

    context "hand contains an ace" do
      it "returns the sum of a face card and an ace" do
        expect(winning_hand_with_ace.calculate_hand).to eq(21)
      end

      it "returns the sum of two face cards and an ace" do
        expect(face_cards_with_ace.calculate_hand).to eq(21)
      end
    end

  end
end
