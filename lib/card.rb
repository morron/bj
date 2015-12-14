class Card
  attr_reader :value
  attr_accessor :suit, :face

  def initialize(suit, face)
    @face = face
    @suit = suit

    case face
    when 2..10
      @value = face
    when 'J', 'Q', 'K'
      @value = 10
    when 'A'
      @value = 1
      @is_ace = true
    end
  end

  def to_s
    "#{@face} of #{@suit}"
  end
end
