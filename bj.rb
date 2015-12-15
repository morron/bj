$LOAD_PATH.unshift File.dirname(__FILE__)

require 'pry'
require 'classes/Deck'
require 'classes/Dealer'
require 'classes/Player'

def start
  p 'Hello!'
  deck = Deck.new
  player = Player.new
  dealer = Dealer.new

  p 'Let\'s Game begin'
  p '-------------------------'
  2.times { player.push(deck.pop) }
  2.times { dealer.push(deck.pop) }
end

start if __FILE__ == $PROGRAM_NAME
