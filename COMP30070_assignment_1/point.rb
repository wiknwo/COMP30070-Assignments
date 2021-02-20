class Point
  def initialize(a, b)
    @x_coordinate = a
    @y_coordinate = b
  end

  def !=(other)
    return (self.x_coordinate != other.x_coordinate) || (self.y_coordinate != other.y_coordinate)
  end

  attr_reader :x_coordinate
  attr_reader :y_coordinate
end