class Player
  attr_reader :name
  attr_accessor :hp, :atk_power

  MAX_HIT_POINTS = 100

  def initialize(name)
    @name = name
    @hp = MAX_HIT_POINTS
    @atk_power = 1
  end

  def damage(amount)
    @hp -= amount
    @hp = @hp < 0 ? 0 : @hp
  end

  def heal(amount)
    @hp += amount
    @hp = @hp > MAX_HIT_POINTS ? MAX_HIT_POINTS : @hp
  end

  def alive?
    @hp > 0
  end
end
