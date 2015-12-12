$LOAD_PATH.unshift File.dirname(__FILE__)

require 'Card'

class Deck
  SUITS = [:spades, :hearts, :diams, :clubs]
  FACES = (2..10).to_a | ['j', 'q', 'k', 'a']

  attr_accessor :cards

  def initialize
      @cards = SUITS.map { |suit| FACES.map { |face| Card.new(suit, face) } }.flatten
      @cards.shuffle!
  end

  def empty?
    @cards.empty?
  end

  def to_s
    @cards.join(', ')
  end

end
