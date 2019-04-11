class Card
  attr_reader :suit, :rank

  def initialize(suit, rank)
    @suit = suit
    @rank = rank
  end

  def compare(other_card)
    if @rank == "A"
      1
    else
      0
    end
  end
  
end
