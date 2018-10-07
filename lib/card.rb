class Card  
  
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def description
    return "#{rank} of #{suit}"
  end

  def value
    scores = {
      "Two" => 2,
      "Three" => 3,
      "Four" => 4,
      "Five" => 5,
      "Six" => 6,
      "Seven" => 7,
      "Eight" => 8,
      "Nine" => 9,
      "Jack" => 10,
      "Queen" => 10,
      "King" => 10,
      "Ace" => 11
    }
    return scores[rank]
  end
end
