require 'game'

describe Game do

  subject(:game) { described_class.new(deck) }
  let(:player) { double :player, name: "Luc" }
  let(:deck) { double :deck, cards: [card, card, card, card] }
  let(:deck2) { double :deck, cards: [card2, card3, card, card] }
  let(:deck3) { double :deck, cards: [card2, card2, card2, card2, card2, card2] }
  let(:card) { double :card, rank: "Two", suit: "Hearts" }
  let(:card2) { double :card, rank: "King", suit: "Hearts" }
  let(:card3) { double :card, rank: "Ace", suit: "Hearts" }

  describe '#initialize' do
    it 'initializes with 2 players' do
      expect(game.player).to be_a(Player)
      expect(game.dealer).to be_a(Player)
    end
  end

  describe '#deal' do
    it 'deals 2 cards to each player' do
      allow(card).to receive(:value).and_return(2)
      game.deal
      expect(game.player.hand.size).to eq 2
      expect(game.dealer.hand.size).to eq 2
    end
  end

  describe '#print_scores' do
    it 'prints a string with scores' do
      allow(card).to receive(:value).and_return(2)
      game.deal
      expect(game.print_scores).to eq("Score: Sam: 4, Dealer: 4")
    end
  end

  describe '#determine_blackjack' do
    it 'determines if anyone has blackjack' do
      allow(player).to receive(:score).and_return(21)
      game.deal
      expect(game.determine_blackjack(player)).to eq("Blackjack! Luc wins!")
    end
  end

  describe '#determine_bust' do
    it 'determines if it is game over when player is busted' do
      allow(player).to receive(:score).and_return(29)
      game.deal
      expect(game.determine_bust(player)).to eq("Game over! Luc busted!")
    end
  end
end
