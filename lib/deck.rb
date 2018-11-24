require './lib/card'

class Deck

  attr_reader :cards

  def initialize
    @cards = []

    ranks = %w{Ace Two Three Four Five Six Seven Eight Nine Ten Jack Queen King}
    suits = %w{Spades Hearts Diamonds Clubs}

    ranks.each do |rank|
      suits.each do |suit|
        @cards << Card.new(rank, suit)
      end
    end
    @cards.shuffle!
  end
end
