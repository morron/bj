$LOAD_PATH.unshift File.dirname(__FILE__)

require 'Deck'
require 'Hand'
require 'Player'

class Dealer
  attr_reader :hand, :player

  def initialize
    @deck = Deck.new
    @hand = Hand.new
    player_name = greet_player
    @player = Player.new(player_name)
    @game_over = false
  end

  def greet_player
    puts "What is your name?\n"
    gets.chomp
  end

  def round
    @game_over = true if player.hand.score > 21 || player.blackjack?
  end

  def new_game
    puts "Let's Game begin\n"
    puts "-------------------------\n\n"
    @player.setup_bet

    deal_to(player)
    show_hand(player)

    deal_to(self)
    show_hand(self)

    # round until @game_over
  end

  def deal_to(person)
    2.times { person.hand.push(@deck.pop) }
  end

  def show_hand(player)
    puts "#{player}'s hand:\n" \
         "------------------\n" \
         "#{player.hand}\n\n"
  end

  def to_s
    self.class.to_s
  end
end
