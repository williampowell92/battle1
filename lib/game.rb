class Game
  attr_reader :player1, :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @turn = 0
  end

  def attack
    @turn.even? ? @player2.decrease_health : @player1.decrease_health
    next_turn
  end

  private

  def next_turn
    @turn += 1
  end
end
