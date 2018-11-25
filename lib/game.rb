require './lib/deck'
require './lib/player'

class Game

  BLACKJACK = 21
  PLAYER_RISK_LEVEL = 17

  attr_reader :player, :dealer, :deck
  attr_accessor :game_over

  def initialize(deck = Deck.new, player = Player.new("Sam"), dealer = Player.new("Dealer"))
    @player = player
    @dealer = dealer
    @deck = deck.cards
    @game_over = false
  end

  def play
    deal
    check_cards
  end

  def player_turn
    raise 'Game is over, Please start a new game.' if game_over?
    while player.score < PLAYER_RISK_LEVEL
      player.hit(deck.shift)
    end
    check_cards
  end

  def dealer_turn
    raise 'Game is over, Please start a new game.' if game_over?
    while dealer.score <= player.score
      dealer.hit(deck.shift)
    end
    @game_over = true
    check_cards
  end

  private

  def blackjack?(player)
    player.score == BLACKJACK
  end

  def bust?(player)
    player.score > BLACKJACK
  end

  def game_over?
    game_over == true
  end

  def deal
    2.times { player.hit(deck.shift) }
    2.times { dealer.hit(deck.shift) }
  end

  def print_scores
    "Score: #{player.name}: #{player.score}, #{dealer.name}: #{dealer.score}"
  end

  def determine_winner
    player.score > dealer.score ? "#{player.name} wins!" : "#{dealer.name} Wins!"
  end

  def check_cards
    if blackjack?(player) && blackjack?(dealer)
      @game_over = true
      "Game over! Game was a draw"
    elsif bust?(player) && bust?(dealer)
      @game_over = true
      "Game over! Game was a draw"
    elsif bust?(player)
      @game_over = true
      "Game over! #{player.name} busted!" 
    elsif bust?(dealer)
      @game_over = true
      "Game over! #{dealer.name} busted!"
    elsif blackjack?(player)
      @game_over = true
      "Blackjack! #{player.name} wins!" 
    elsif blackjack?(dealer)
      @game_over = true
      "Blackjack! #{dealer.name} wins!" 
    elsif game_over?
      determine_winner + print_scores
    else
      print_scores
    end
  end
end
