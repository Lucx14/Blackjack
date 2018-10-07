class Card  

    attr_reader :rank, :suit

    def initialize(rank, suit)
        @rank = rank
        @suit = suit
    end


    def description
        return "#{rank} of #{suit}"
    end


end

