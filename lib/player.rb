class Player
  DEFAULT_HEALTH = 50

  attr_reader :name, :health

  def initialize(name)
    @name = name
    @health = DEFAULT_HEALTH
  end

  def decrease_health
    @health -= 10
  end

  def attack(player)
    player.decrease_health
  end

end
