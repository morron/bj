class Hand
  attr_reader :cards

  def initialize
    @cards = []
  end

  def push(card)
    @cards << card
  end

  def score
    @value ||= @cards.map(&:value).inject(:+)
  end

  def blackjack?
    score == 21
  end

  def to_s
    s = "cards: #{@cards.join(', ')}\n"
    s + "score: #{score}"
  end
end
