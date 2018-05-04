class Game
  attr_reader :player1, :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @turn = 0
  end

  def attack
    victim.decrease_health
    next_turn
  end

  def attacker
    @turn.even? ? @player1 : @player2
  end

  def victim
    @turn.odd? ? @player1 : @player2
  end

  private

  def next_turn
    @turn += 1
  end
end
