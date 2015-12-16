require 'highline/import'
require 'lib/blackjack'

def start
  say 'Hello!'
  dealer = Dealer.new
  dealer.new_game
end

start if __FILE__ == $PROGRAM_NAME
