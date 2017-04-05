class Zombie

  attr_accessor :plague_level
  attr_reader :speed, :strength

  @@horde = []
  @@plague_level = 10
  @@max_speed = 5
  @@max_strength = 8
  @@default_speed = 1
  @@default_strength = 3


# INSTANCE METHODS

  def initialize(speed, strength)
    @speed = speed
    @strength = strength
  end

  def encounter

  end

  def outrun_zombie?

  end

  def survive_attack?

  end

# CLASS METHODS

  def self.all #complete
    @@horde
  end

  def self.spawn # complete
    spawn_quantity = @@plague_level / 5
    spawn_quantity.times do
      zombie = Zombie.new(rand(6),rand(9))
      @@horde.push(zombie)
    end
  end

  def self.new_day

  end

  def self.some_die_off

  end

  def self.increase_plague_level # complete
    @@plague_level = @@plague_level + rand(3)
  end



end
