class Player

  attr_reader :hand

  def initialize
    @hand = []
  end

  def score
    return 0 if hand.size == 0
    (hand.map { |x| x.value }).reduce(:+)
  end

  def hit(card)
    hand.push(card)
  end
end