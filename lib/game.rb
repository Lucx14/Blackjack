require './lib/deck'

class Game

  BLACKJACK = 21
  attr_reader :sam, :dealer, :deck

  def initialize(deck = Deck.new)
    @sam = []
    @dealer = []
    @deck = deck.cards
  end

  def deal_first_hand
    2.times { sam.push(deck.shift) }
    2.times { dealer.push(deck.shift) }
    p "Sam has a score of #{self.calculate_score(self.sam)}"
    p "dealer has a score of #{self.calculate_score(self.dealer)}"
    if blackjack?(self.sam)
      "Blackjack! Sam wins!"
    elsif blackjack?(self.dealer)
      "Blackjack! Dealer wins"
    elsif bust?(self.sam)
      "Dealer wins!"
    elsif bust?(self.dealer)
      "Sam wins!"
    end
  end

  def player_turn
    while self.calculate_score(self.sam) < 17
      sam.push(deck.shift)
    end
    p "Sam has a score of #{self.calculate_score(self.sam)}"
    p "dealer has a score of #{self.calculate_score(self.dealer)}"
    if blackjack?(self.sam)
      "Blackjack! Sam wins!"
    elsif bust?(self.sam)
      "Dealer wins!"
    end
  end

  def dealer_turn
    while self.calculate_score(self.dealer) < self.calculate_score(self.sam)
      dealer.push(deck.shift)
    end
    p "Sam has a score of #{self.calculate_score(self.sam)}"
    p "dealer has a score of #{self.calculate_score(self.dealer)}"
    if blackjack?(self.dealer)
      "Blackjack! Dealer wins!"
    elsif bust?(self.dealer)
      "Sam wins!"
    end
  end



# Hit
# stand
  def calculate_score(hand)
    (hand.map { |x| x.value }).reduce(:+)
  end


  private

  def blackjack?(hand)
    calculate_score(hand) == BLACKJACK
  end

  def bust?(hand)
    calculate_score(hand) > BLACKJACK
  end


end
