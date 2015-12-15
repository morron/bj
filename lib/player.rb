$LOAD_PATH.unshift File.dirname(__FILE__)

require 'Hand'

class Player
  attr_reader :name, :money, :hand

  def initialize(name, money = 1000)
    @name = name
    @hand = Hand.new
    @money = money
  end

  def bet(bet)
    @money -= bet
  end

  def empty?
    @money <= 0
  end

  def setup_bet
    bet = 0
    loop do
      bet = ask 'How much would you like to bet on this hand?', Integer
      break if bet > 0
      say 'Sorry, invalid bet amount'
    end
    bet(bet)

    say "Thank you, you have $#{@money} left"
  end

  def to_s
    @name || 'Player'
  end
end
