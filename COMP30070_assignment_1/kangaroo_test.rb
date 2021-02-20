require 'test/unit'
require_relative 'kangaroo.rb'

class KangarooTest < Test::Unit::TestCase
  def setup
    @my_kangaroo = Kangaroo.new
  end

  def test_initialize
    assert_equal(0, @my_kangaroo.num_hops)
    assert_equal(false, @my_kangaroo.curr_point != Point.new(0, 0))
  end

  def test_hop
    point = Point.new(1, 0)
    tmp = @my_kangaroo.num_hops
    @my_kangaroo.hop(point)
    assert_equal(point, @my_kangaroo.curr_point)
    assert_equal(tmp + 1, @my_kangaroo.num_hops)
  end

  def test_is_a_kangaroo
    assert_respond_to(@my_kangaroo, :hop)
  end
end