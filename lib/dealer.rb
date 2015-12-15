$LOAD_PATH.unshift File.dirname(__FILE__)

require 'Deck'
require 'Hand'
require 'Player'

class Dealer
  attr_reader :hand, :player

  def initialize
    @deck = Deck.new
    @hand = Hand.new
    player_name = ask 'What is your name?'
    @player = Player.new(player_name)
    @game_over = false
  end

  def round
    choose do |move|
      move.prompt = 'You move?  '
      move.choice(:hit_me) do
        deal_to(@player, 1)
        show_hand(@player)
      end
      move.choice(:pass) do
        say 'game over'
        @game_over = true
      end
    end
    @game_over = true if @player.hand.score > 21 || @player.hand.blackjack?
  end

  def new_game
    say "Let's Game begin\n"
    say "-------------------------\n\n"
    @player.setup_bet

    deal_to(@player, 2)
    show_hand(@player)

    deal_to(self, 2)
    show_hand(self)

    round until @game_over
  end

  def deal_to(person, count = 1)
    count.times { person.hand.push(@deck.pop) }
  end

  def show_hand(player)
    say "#{player}'s hand:\n" \
         "------------------\n" \
         "#{player.hand}\n\n"
  end

  def to_s
    self.class.to_s
  end
end
