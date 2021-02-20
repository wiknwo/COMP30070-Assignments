require 'test/unit'
require_relative 'grid.rb'

class GridTest < Test::Unit::TestCase
  def setup
    @my_grid = Grid.new(1)
  end

  def test_is_out_of_bounds
    assert_equal(true , @my_grid.is_out_of_bounds?(Point.new(2, 0)))
  end
end