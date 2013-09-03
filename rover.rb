#
# Class Rover represents a robotic rover that can be landed by anybody on a rectangular plateau.
#

require "./input_features.rb"

class Rover
  FACING = [InputFeatures.FACING_NORTH , InputFeatures.FACING_EAST,
            InputFeatures.FACING_SOUTH, InputFeatures.FACING_WEST]

  def initialize (max_x, max_y)
    @max_x        = max_x.to_i
    @max_y        = max_y.to_i
    @min_x        = 0
    @min_y        = 0
    @x            = 0
    @y            = 0
    @facing_index = 0
  end

  def set_x(x)
    @x = x.to_i
  end

  def set_y(y)
    @y = y.to_i
  end

  def set_facing(facing)
    @facing_index = FACING.index(facing)
  end

  def left
    @facing_index -= 1
    @facing_index = @facing_index == -1 ? FACING.length - 1 : @facing_index
  end

  def right
    @facing_index += 1
    @facing_index = @facing_index == FACING.length ? 0 : @facing_index
  end

  def move
    @y += 1 if self.facing == InputFeatures.FACING_NORTH && @y < @max_y
    @y -= 1 if self.facing == InputFeatures.FACING_SOUTH && @y > @min_y

    @x += 1 if self.facing == InputFeatures.FACING_EAST && @x < @max_x
    @x -= 1 if self.facing == InputFeatures.FACING_WEST && @x > @min_x
  end

  def facing
    FACING[@facing_index]
  end

  def actual_state_string
    "#{@x.to_s} #{@y.to_s} #{self.facing}"
  end
end
