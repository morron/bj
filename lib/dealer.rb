$LOAD_PATH.unshift File.dirname(__FILE__)

require 'Hand'

class Dealer
  attr_reader :hand, :player

  def initialize
    @deck = Deck.new
    @hand = Hand.new
    @player = Player.new
    @game_over = false
  end

  def round
    player.push(@deck.pop)
    @game_over = true if player.score > 21 || player.blackjack?
  end

  def new_game
    p 'Let\'s game begin!'
    @player.setup_bet

    deal_to(player.hand)
    deal_to(@hand)
    puts ">>> Initial cards dealt\n\n\n\n"
    round until @game_over
  end

  def deal_to(hand)
    2.times { hand.push(@deck.pop) }
  end
end
