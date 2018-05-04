class Game
  attr_accessor :player1, :player2, :turn

  def initialize
    @turn = 0
  end

  @@instance = Game.new

  def self.instance
    @@instance
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

  private_class_method :new
end
