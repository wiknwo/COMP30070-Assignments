require_relative 'point.rb'

class Kangaroo
  def initialize
    @curr_point = Point.new(0, 0)
    @num_hops = 0
  end

  # This method takes a point object as input and sets the kangaroo's current point
  # to this new point.
  def hop(point)
    @curr_point = point
    @num_hops += 1
  end

  attr_reader :num_hops   #Need to display total number of hops
  attr_reader :curr_point #Need to access current point.
end