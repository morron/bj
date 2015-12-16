$LOAD_PATH.unshift File.dirname(__FILE__)

require 'Hand'

class Player
  attr_reader :name, :hand, :bet
  attr_accessor :money

  def initialize(name, money = 1000)
    @name = name
    @bet = 0
    @hand = Hand.new
    @money = money
  end

  def bet_up_to(value)
    @money -= value
    @bet += value
  end

  def empty?
    @money <= 0
  end

  def set_bet_on(limit = @money)
    bet = 0
    choices = %w(10 20 50 100)
    say "How much would you like to bet on? You can bet up to $#{limit}"
    say choices.map { |c| "#{c}\n" }.join
    loop do
      bet = ask('> ', choices).to_i
      break if bet > 0 && bet <= limit
      say "Sorry, invalid bet amount. You can bet up to $#{limit}"
    end
    bet_up_to(bet)

    say "Thank you, you have $#{@money} left"
  end

  def double_down_bet
    bet_up_to(@bet) if @bet <= @money
  end

  def to_s
    @name || 'Player'
  end
end
