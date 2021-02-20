require 'test/unit'
require_relative 'point.rb'

class PointTest < Test::Unit::TestCase
  def setup
    @my_point = Point.new(0, 0)
  end

  def test_initialize
    assert_equal(0, @my_point.x_coordinate)
    assert_equal(0, @my_point.y_coordinate)
  end

  def test_not_equals
    other_point = Point.new(1, 0)
    assert_equal(true , @my_point != other_point)
  end

  def  test_has_x_y
    assert_respond_to(@my_point, :x_coordinate)
    assert_respond_to(@my_point, :y_coordinate)
  end

end