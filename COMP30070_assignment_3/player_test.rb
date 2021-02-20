require 'test/unit'
require_relative 'player.rb'

class PlayerTest < Test::Unit::TestCase
  def setup
    @player1 = Player.new('Mario', 5, 7)
  end

  def test_initialize
    assert(@player1.proficiency >= 1 && @player1.proficiency <= 10, 'player proficiency is not in range 1..10')
    assert(@player1.minimum_desired_proficiency >= 1 && @player1.minimum_desired_proficiency <= 10, 'player minimum_desired_proficiency is not in range 1..10')
  end

  def test_spaceship_operator
    @player2 = Player.new('Luigi', 6, 4)
    assert_equal(-1, @player1 <=> @player2)
    assert_equal(1, @player2 <=> @player1)
    assert_equal(0, @player1 <=> @player1)
  end

  def test_satisfaction
    @player2 = Player.new('Luigi', 6, 4)
    assert_equal(0.0, @player2.satisfaction(@player1), 'satisfaction is not being calculated correctly when proficiency of player is >= minimum_desired_proficiency')
    assert_equal(@player2.proficiency - @player1.minimum_desired_proficiency, @player1.satisfaction(@player2), 'satisfaction is not being calculated correctly when proficiency of player is not >= minimum_desired_proficiency')
  end
end