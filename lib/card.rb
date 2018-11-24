require './lib/scores'

class Card
  include Scores

  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def description
    "#{rank} of #{suit}"
  end

  def value
    Scores::SCORES[rank]
  end
end
