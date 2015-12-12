class Card
  attr_accessor :suit, :face

  def initialize suit, face
    @face = face
    @suit = suit
  end

  def to_s
    "#{@face} of #{@suit}"
  end
end
