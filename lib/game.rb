require './lib/deck'
require './lib/player'

class Game

  BLACKJACK = 21
  attr_reader :sam, :dealer, :deck

  def initialize(deck = Deck.new, sam = Player.new, dealer = Player.new)
    @sam = sam
    @dealer = dealer
    @deck = deck.cards
  end

  def deal_first_hand
    2.times { sam.hit(deck.shift) }
    2.times { dealer.hit(deck.shift) }
    p "Sam has a score of #{sam.score}"
    p "dealer has a score of #{dealer.score}"
    if blackjack?(sam)
      "Blackjack! Sam wins!"
    elsif blackjack?(dealer)
      "Blackjack! Dealer wins"
    elsif bust?(sam)
      "Dealer wins!"
    elsif bust?(dealer)
      "Sam wins!"
    end
  end

  def player_turn
    while sam.score < 17
      sam.hit(deck.shift)
    end
    p "Sam has a score of #{sam.score}"
    p "dealer has a score of #{dealer.score}"
    if blackjack?(sam)
      "Blackjack! Sam wins!"
    elsif bust?(sam)
      "Dealer wins!"
    end
  end

  def dealer_turn
    while dealer.score < sam.score
      dealer.hit(deck.shift)
    end
    p "Sam has a score of #{sam.score}"
    p "dealer has a score of #{dealer.score}"
    if blackjack?(dealer)
      "Blackjack! Dealer wins!"
    elsif bust?(dealer)
      "Sam wins!"
    end
  end



  private

  def blackjack?(player)
    player.score == BLACKJACK
  end

  def bust?(player)
    player.score > BLACKJACK
  end


end
