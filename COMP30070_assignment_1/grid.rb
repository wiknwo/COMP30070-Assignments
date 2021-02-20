require_relative 'point.rb'

class Grid
  def initialize(size)
    @size_of_grid = size
  end

  #This method checks if a point is off the grid
  def is_out_of_bounds?(point)
    return point.x_coordinate < 0 || point.y_coordinate < 0 || point.x_coordinate > @size_of_grid || point.y_coordinate > @size_of_grid
  end
end