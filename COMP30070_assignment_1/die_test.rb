require 'test/unit'
require_relative 'die.rb'

class DieTest < Test::Unit::TestCase
  def setup
    @my_die = Die.new
  end

  def test_roll_die
    assert_operator(@my_die.roll_die, :>=, 1)
    assert_operator(@my_die.roll_die, :<=, 4)
  end
end