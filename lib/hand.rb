require_relative 'deck'

class Hand
  def initialize(cards = [])
    @cards = cards
    @score = nil
  end

  def calculate_hand
    if @score == nil
      @score = 0
      sorted_cards = @cards.sort! { |card1, card2| card1.compare(card2) }
      sorted_cards.each do |card|
        if card.rank.class == Fixnum
          @score += card.rank
        elsif card.rank == "A"
          if @score <= 10
            @score += 11
          else
            @score += 1
          end
        else
          @score += 10
        end
      end
    end
    @score
  end

  def cards
    @cards.clone
  end

  def add_cards(new_cards)
    @cards += new_cards
    @score = nil
  end
end
