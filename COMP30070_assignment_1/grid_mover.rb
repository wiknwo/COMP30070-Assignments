require_relative 'point.rb'

class GridMover

  #Static method that returns potential point a kangaroo could hop to.
  def self.moveKangaroo(face_value, curr_point)
    case face_value
    when 1 then tmp = Point.new(curr_point.x_coordinate, curr_point.y_coordinate + 1)    #NORTH
    when 2 then tmp = Point.new(curr_point.x_coordinate, curr_point.y_coordinate - 1)    #SOUTH
    when 3 then tmp = Point.new(curr_point.x_coordinate + 1, curr_point.y_coordinate)    #EAST
    when 4 then tmp = Point.new(curr_point.x_coordinate - 1, curr_point.y_coordinate)    #WEST
    end
  end
end