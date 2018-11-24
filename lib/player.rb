class Player

  attr_reader :hand, :name

  def initialize(name)
    @hand = []
    @name = name
  end

  def score
    return 0 if hand.size.zero?

    (hand.map { |x| x.value }).reduce(:+)
  end

  def hit(card)
    hand.push(card)
  end
end
