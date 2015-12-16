$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)

require 'pry'
require 'highline/import'
require 'Dealer'

def start
  say 'Hello!'
  dealer = Dealer.new
  dealer.new_game
end

start if __FILE__ == $PROGRAM_NAME
