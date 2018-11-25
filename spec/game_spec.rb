require 'game'

describe Game do

  subject(:game) { described_class.new(deck, player, dealer) }
  let(:player) { double :player, name: "Luc" }
  let(:dealer) { double :dealer, name: "Dealer" }
  let(:deck) { double :deck, cards: [card, card, card, card] }
  let(:deck2) { double :deck, cards: [card2, card3, card, card] }
  let(:deck3) { double :deck, cards: [card2, card2, card2, card2, card2, card2] }
  let(:card) { double :card, rank: "Two", suit: "Hearts" }
  let(:card2) { double :card, rank: "King", suit: "Hearts" }
  let(:card3) { double :card, rank: "Ace", suit: "Hearts" }


  describe '#play' do
    it 'deals 2 cards to each player' do
      allow(player).to receive(:hit)
      allow(dealer).to receive(:hit)
      allow(player).to receive(:score).and_return(10)
      allow(dealer).to receive(:score).and_return(10)
      expect(game.play).to eq "Score: Luc: 10, Dealer: 10"
      
    end

    it 'ends the game if both players get blackjack' do
      allow(player).to receive(:hit)
      allow(dealer).to receive(:hit)
      allow(player).to receive(:score).and_return(21)
      allow(dealer).to receive(:score).and_return(21)
      expect(game.play).to eq "Game over! Game was a draw"
      expect(game.game_over).to be true
    end

    it 'ends game if both players bust' do
      allow(player).to receive(:hit)
      allow(dealer).to receive(:hit)
      allow(player).to receive(:score).and_return(23)
      allow(dealer).to receive(:score).and_return(23)
      expect(game.play).to eq "Game over! Game was a draw"
      expect(game.game_over).to be true
    end

    it 'declares if a player has blackjack' do
      allow(player).to receive(:hit)
      allow(dealer).to receive(:hit)
      allow(player).to receive(:score).and_return(21)
      allow(dealer).to receive(:score).and_return(20)
      expect(game.play).to eq "Blackjack! Luc wins!"
      expect(game.game_over).to be true
    end

    it 'declares if the dealer has blackjack' do
      allow(player).to receive(:hit)
      allow(dealer).to receive(:hit)
      allow(player).to receive(:score).and_return(20)
      allow(dealer).to receive(:score).and_return(21)
      expect(game.play).to eq "Blackjack! Dealer wins!"
      expect(game.game_over).to be true
    end





  end

  describe '#player_turn' do
    it 'Player draws cards and score is checked' do
      allow(player).to receive(:score).and_return(17)
      allow(dealer).to receive(:score).and_return(10)
      expect(game.player_turn).to eq "Score: Luc: 17, Dealer: 10"
    end
    it 'Throws an error if the game is already over' do
      allow(player).to receive(:hit)
      allow(dealer).to receive(:hit)
      allow(player).to receive(:score).and_return(44)
      allow(dealer).to receive(:score).and_return(10)
      game.play
      expect { game.player_turn }.to raise_error 'Game is over, Please start a new game.'
    end

  end

  describe '#dealer_turn' do
    it 'Dealer draws cards and score is checked' do
      allow(player).to receive(:score).and_return(17)
      allow(dealer).to receive(:score).and_return(20)
      expect(game.dealer_turn).to eq "Dealer Wins!Score: Luc: 17, Dealer: 20"
    end
    it 'Throws an error if the game is already over' do
      allow(player).to receive(:score).and_return(17)
      allow(dealer).to receive(:score).and_return(25)
      game.player_turn
      expect { game.dealer_turn }.to raise_error 'Game is over, Please start a new game.'
    end

  end
end
