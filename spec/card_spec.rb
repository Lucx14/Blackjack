require 'card'

describe Card do  
    subject(:card) { described_class.new("Ace", "Spades") }

    describe '#description' do
        it "returns a string that describes itself" do
            expect(card.description).to eq("Ace of Spades")
        end
    end
end

