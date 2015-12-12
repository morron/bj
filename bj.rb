$LOAD_PATH.unshift File.dirname(__FILE__)

require 'pry'
require 'classes/Deck'

def start
  p 'Hello!'
  deck = Deck.new
  p deck.cards.count
  puts deck
end

if __FILE__ == $0
    start
end
