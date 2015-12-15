$LOAD_PATH.unshift File.dirname(__FILE__)

require 'Hand'

class Player
  attr_reader :money, :hand

  def initialize(money = 1000)
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
      puts "How much would you like to bet on this hand? You can bet up to $#{bet_limit}"
      bet = gets.chomp.to_i
      break if bet > 0
      puts "Sorry, invalid bet amount.\n\n"
    end
    bet(bet)

    puts "Thank you, you have $#{@money} left\n\n"
    end
end
