require 'test/unit'
require_relative 'grid_mover.rb'

class GridMoverTest < Test::Unit::TestCase
  def setup
    @my_point = Point.new(0, 0)
  end

  def test_move_kangaroo
    new_point = GridMover.moveKangaroo(1, @my_point)
    assert_equal(@my_point.x_coordinate, new_point.x_coordinate)
    assert_equal(@my_point.y_coordinate + 1, new_point.y_coordinate)

    new_point = GridMover.moveKangaroo(2, @my_point)
    assert_equal(@my_point.x_coordinate, new_point.x_coordinate)
    assert_equal(@my_point.y_coordinate - 1, new_point.y_coordinate)

    new_point = GridMover.moveKangaroo(3, @my_point)
    assert_equal(@my_point.x_coordinate + 1, new_point.x_coordinate)
    assert_equal(@my_point.y_coordinate, new_point.y_coordinate)

    new_point = GridMover.moveKangaroo(4, @my_point)
    assert_equal(@my_point.x_coordinate - 1, new_point.x_coordinate)
    assert_equal(@my_point.y_coordinate, new_point.y_coordinate)
  end
end