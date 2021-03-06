require 'player'

describe Player do

  subject(:player) { described_class.new("Luc") }
  let(:card) { double :card, rank: "Two", suit: "Hearts" }
  let(:card2) { double :card, rank: "King", suit: "Hearts" }
  let(:card3) { double :card, rank: "Ace", suit: "Hearts" }

  describe '#score' do
    it 'calculates the score of the players current hand' do
      allow(card).to receive(:value).and_return(2)
      player.hit(card)
      player.hit(card)
      expect(player.score).to eq 4
    end
  end

  describe '#hit' do
    it 'adds a card to the players hand' do
      player.hit('Hello')
      expect(player.hand.size).to eq 1
      expect(player.hand[0]).to eq "Hello"
    end
  end

end
