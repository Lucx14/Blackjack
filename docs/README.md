Guardian Tech test 21's
============================

Tags: Ruby, RSpec, TDD, OOP

A small program that models a game of blackjack. The program lets a user play a game of blackjack against a virtual dealer using commands in the terminal. The player interface is 3 simple commands, Play to begin the game, player_turn followed by dealer_turn.

#### Requirements of the tech test
* create a single deck of playing cards
* two players (called Sam and the Dealer) who will play against each other
* each player is given two cards from the top of a shuffled deck of cards
* determine score of a hand.
* Numbered cards are their point value. Jack, Queen and King count as 10 and Ace counts as 11.
* check if either player has blackjack (21) with their initial hand and wins the game
* if neither player has blackjack then Sam can start drawing cards from the top of the deck
* Sam should stop drawing cards from the deck if their total reaches 17 or higher
* Sam has lost the game if their total is higher than 21 
* when Sam has stopped drawing cards the Dealer can start drawing cards from the top of the deck
* the Dealer should stop drawing cards when their total is higher than Sam.
* the Dealer has lost the game if their total is higher than 21 
* determine which player wins the game

### Usage instructions

Clone the project and then cd into it

```
$ git clone https://github.com/Lucx14/Blackjack.git
$ cd Blackjack
$ bundle install
```

example usage in pry or irb

```
21s git:(master) ✗ pry
[1] pry(main)> require './lib/game'
=> true
[2] pry(main)> game = Game.new
=> #<Game:0x00007fa3b716e6c8
[3] pry(main)> game.play
=> "Score: Sam: 7, Dealer: 17"
[4] pry(main)> game.player_turn
=> "Score: Sam: 17, Dealer: 17"
[5] pry(main)> game.dealer_turn
=> "Game over! Dealer busted!"
[6] pry(main)>
```

To view the tests and test coverage run RSpec in the command line

```
Card
  #description
    returns a string that describes itself
  #value
    is able to calculate its value

Deck
  #initialize
    initializes with 52 cards

Game
  #play
    deals 2 cards to each player
    ends the game if both players get blackjack
    ends game if both players bust
    declares if a player has blackjack
    declares if the dealer has blackjack
  #player_turn
    Player draws cards and score is checked
    Throws an error if the game is already over
  #dealer_turn
    Dealer draws cards and score is checked
    Throws an error if the game is already over

Player
  #score
    calculates the score of the players current hand
  #hit
    adds a card to the players hand

Finished in 0.02313 seconds (files took 0.34517 seconds to load)
14 examples, 0 failures


COVERAGE:  98.91% -- 182/184 lines in 10 files

+----------+-------------+-------+--------+---------+
| coverage | file        | lines | missed | missing |
+----------+-------------+-------+--------+---------+
|  96.77%  | lib/game.rb | 62    | 2      | 28, 37  |
+----------+-------------+-------+--------+---------+
```

Project file structure

```
.
├── Gemfile
├── Gemfile.lock
├── coverage
├── docs
│   ├── CRC-Cards.md
│   ├── README.md
│   └── User\ Stories.md
├── lib
│   ├── card.rb
│   ├── deck.rb
│   ├── game.rb
│   ├── player.rb
│   └── scores.rb
└── spec
    ├── card_spec.rb
    ├── deck_spec.rb
    ├── features
    │   └── user_stories_spec.rb
    ├── game_spec.rb
    ├── player_spec.rb
    └── spec_helper.rb
```
