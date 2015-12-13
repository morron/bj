$LOAD_PATH.unshift File.dirname(__FILE__)

require 'Hand'

class Dealer
  include Hand

  def initialize
    @cards = []
  end
end
