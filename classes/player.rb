$LOAD_PATH.unshift File.dirname(__FILE__)

require 'Hand'

class Player
  include Hand
  attr_reader :money

  def initialize(money = 1000)
    @cards = []
    @money = money
  end

end
