require 'game'


describe Game do

  subject(:game) { described_class.new }

  describe '#initialize' do
    it 'initializes with 2 players with no cards - empty arrays' do
      expect(game.sam).to eq([])
      expect(game.dealer).to eq([])
    end
  end
end
