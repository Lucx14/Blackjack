require 'deck'

describe Deck do   
  subject(:deck) { described_class.new }
  
  describe '#initialize' do
    it "initializes with 52 cards" do
      expect(deck.cards.size).to eq(52)
    end
  end
end
