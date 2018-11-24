require 'player'

describe Player do

  subject(:player) { described_class.new }
  let(:card) { double :card, rank: "Two", suit: "Hearts" }
  let(:card2) { double :card, rank: "King", suit: "Hearts" }
  let(:card3) { double :card, rank: "Ace", suit: "Hearts" }

  describe '#initialize' do
    it 'initializes with no cards - empty array' do
      expect(player.hand).to eq([])
    end
  end

  describe '#calculate_score' do
    it 'calculates the score of the players current hand' do
      expect(player.score).to eq 0
    end
  end

  describe '#hit' do
    it 'adds a card to the players hand' do
      player.hit('Hello')
      expect(player.hand.size).to eq 1
    end

  end

end

