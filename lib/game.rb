require './lib/deck'
require './lib/player'

class Game

  BLACKJACK = 21
  PLAYER_RISK_LEVEL = 17

  attr_reader :player, :dealer, :deck

  def initialize(deck = Deck.new, player = Player.new("Sam"), dealer = Player.new("Dealer"))
    @player = player
    @dealer = dealer
    @deck = deck.cards
  end

  def play
    deal
    determine_blackjack(player)
    determine_blackjack(dealer)
    determine_bust(player)
    determine_bust(dealer)
    print_scores
  end

  def player_turn
    while player.score < PLAYER_RISK_LEVEL
      player.hit(deck.shift)
    end
    determine_blackjack(player)
    determine_bust(player)
    print_scores
  end

  def dealer_turn
    while dealer.score < player.score
      dealer.hit(deck.shift)
    end
    determine_blackjack(dealer)
    determine_bust(dealer)
    print_scores
  end

  def deal
    2.times { player.hit(deck.shift) }
    2.times { dealer.hit(deck.shift) }
  end
  
  def print_scores
    "Score: #{player.name}: #{player.score}, #{dealer.name}: #{dealer.score}"
  end

  def determine_blackjack(player)
    "Blackjack! #{player.name} wins!" if blackjack?(player)
  end

  def determine_bust(player)
    "Game over! #{player.name} busted!" if bust?(player)
  end

  private

  def blackjack?(player)
    player.score == BLACKJACK
  end

  def bust?(player)
    player.score > BLACKJACK
  end
end
