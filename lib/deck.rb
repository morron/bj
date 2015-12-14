$LOAD_PATH.unshift File.dirname(__FILE__)

require 'Card'

class Deck
  SUITS = [:spades, :hearts, :diams, :clubs]
  FACES = (2..10).to_a | %w(J Q K A)

  attr_accessor :cards

  def initialize
    @cards = SUITS.map do |suit|
      FACES.map { |face| Card.new(suit, face) }
    end.flatten
    @cards.shuffle!
  end

  def pop
    @cards.pop unless empty?
  end

  def size
    @cards.count
  end

  def empty?
    @cards.empty?
  end

  def to_s
    @cards.join(', ')
  end
end
