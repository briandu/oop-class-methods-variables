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

  def outrun_zombie? # completed
    zombie = @@horde[ rand( @@horde.count + 1 ) ]
    if rand( @@max_speed + 1 ) >= zombie.speed
      return true
    else
      return false
    end
  end

  def survive_attack? # completed
    zombie = @@horde[ rand( @@horde.count + 1 ) ]
    if rand( @@max_strength + 1 ) >= zombie.strength
      return true
    else
      return false
    end
  end

# CLASS METHODS

  def self.all #complete
    @@horde
  end

  def self.spawn # complete
    spawn_quantity = @@plague_level / 2
    spawn_quantity.times do
      zombie = Zombie.new(rand(@@max_speed + 1),rand(@@max_strength + 1))
      @@horde.push(zombie)
    end
  end

  def self.new_day # complete
    some_die_off
    spawn
    increase_plague_level
    puts "#{some_die_off} zombies died and #{spawn} zombies spawned today. Plague level also increased to #{increase_plague_level}."
  end

  def self.some_die_off # complete
    number_remove = rand(11)
    number_remove.times do
      @@horde.delete_at( rand( @@horde.count + 1 ) )
    end
  end

  def self.increase_plague_level # complete
    @@plague_level = @@plague_level + rand(3)
  end

  def self.encounter # complete
    encounter = outrun_zombie? || survive_attack?
    if encounter == true
      puts "You escaped!"
    else
      puts "You are now infected. You became a zombie."
      abort
    end
  end

end
