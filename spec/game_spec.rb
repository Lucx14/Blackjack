require 'game'


describe Game do

  subject(:game) { described_class.new(deck) }
  let(:deck) { double :deck, cards: [card, card, card, card] }
  let(:card) { double :card, rank: "Two", suit: "Hearts" }
  let(:card2) { double :card, rank: "King", suit: "Hearts" }
  let(:card3) { double :card, rank: "Ace", suit: "Hearts" }

  describe '#initialize' do

    it 'initializes with 2 players' do
      expect(game.sam).to be_a(Player)
      expect(game.dealer).to be_a(Player)
    end

    it 'initializes with a deck of 52 cards' do
      # expect(game.deck.size).to eq(52)
      expect(game.deck.size).to eq(4)
    end
  end



  describe '#deal_first_hand' do

    it 'deals 2 cards to each player' do
      allow(card).to receive(:value).and_return(2)
      game.deal_first_hand
      expect(game.sam.hand.size).to eq 2
    end

  end


  describe '#calculate_score' do

    it 'calculates the score of a hand at any given time' do
      allow(card).to receive(:value).and_return(2)
      game.deal_first_hand
      expect(game.sam.score).to eq(4)
    end
  end




end
