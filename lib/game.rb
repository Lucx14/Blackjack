require './lib/deck'

class Game


  attr_reader :sam, :dealer, :deck

  def initialize(deck = Deck.new)
    @sam = []
    @dealer = []
    @deck = deck
  end




end
