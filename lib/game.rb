require './lib/deck'

class Game


  attr_reader :sam, :dealer, :deck

  def initialize(deck = Deck.new)
    @sam = []
    @dealer = []
    @deck = deck.cards
  end

  def deal_first_hand
    2.times { sam.push(deck.shift) }
    2.times { dealer.push(deck.shift) }
  end


# Hit
# stand



end
