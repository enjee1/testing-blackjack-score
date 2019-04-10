require_relative 'deck'

class Hand
  def initialize(cards = [])
    @cards = cards
  end

  def calculate_hand
    face_cards = [ 'J', 'Q', 'K', 'A']
    sum = 0
    @cards.each do |card|
      if face_cards.include?(card.rank)
        sum += score_face_cards(card.rank)
      else
        sum += card.rank
      end
    end

    if sum > 21 && @cards.any? { |card| card.rank == "A" }
      sum -= 10
    end

    sum
  end

  def score_face_cards(rank)
    card_value = 0
    if rank == "A"
      card_value = 11
    else
      card_value = 10
    end
    card_value
  end
end
