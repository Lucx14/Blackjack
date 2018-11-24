require 'game'


describe Game do

  subject(:game) { described_class.new }

  describe '#initialize' do

    it 'initializes with 2 players with no cards - empty arrays' do
      expect(game.sam).to eq([])
      expect(game.dealer).to eq([])
    end

    it 'initializes with a deck of 52 cards' do
      expect(game.deck.cards.size).to eq(52)
    end

  end
end
