class Dealer
  attr_reader :hand, :player

  def initialize
    @deck = Deck.new
    @hand = Hand.new
    player_name = ask 'What is your name?'
    @player = Player.new(player_name)
    @game_over = false
  end

  def round
    show_hand(@player)
    choose do |move|
      move.prompt = 'You move?  '
      move.choice(:hit) do
        deal_to(@player)
      end
      move.choice(:double) do
        @player.double_down_bet
        deal_to(@player)
      end
      move.choice(:stay) do
        @game_over = true
      end
    end
    @game_over = true if @player.hand.score > 21 || @player.hand.blackjack?
  end

  def new_game
    say "Let's Game begin\n"
    say "-------------------------\n\n"
    @player.hand.reset
    @hand.reset
    @game_over = false

    @player.set_bet_on

    deal_to(@player, 2)
    deal_to(self, 2)

    show_self_card

    round until @game_over
    if @game_over
      deal_to(self) until @hand.score > 17
      game_result

      choose do |move|
        move.prompt = 'New game? '
        move.choice(:'new game') { new_game }
        move.choice(:exit) { return }
      end
    end
  end

  def deal_to(player, count = 1)
    count.times { player.hand.push(@deck.pop) }
  end

  def show_hand(player)
    say "\n#{player}'s hand:\n" \
         "------------------\n" \
         "#{player.hand}\n\n"
  end

  def show_self_card
    say "\n#{self}'s hand:\n" \
         "------------------\n" \
         "#{player.hand.cards[1]}\n\n"
  end

  def game_result
    show_hand(@player)
    show_hand(self)

    if @player.hand.score < @hand.score || @player.hand.bust?
      say "#{player} lose game. sry."
    elsif @player.hand.score > @hand.score || @player.hand.blackjack?
      @player.money += @player.bet * 1.5
      say "#{player} won! "
    elsif @player.hand.score == @hand.score
      @player.money += @player.bet
      say "It's a draw. #{player} returns bet"
    end
    say "#{player} money is #{player.money}"
  end

  def to_s
    self.class.to_s
  end
end
