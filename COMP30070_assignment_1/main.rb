require_relative 'kangaroo.rb'
require_relative 'grid.rb'
require_relative 'die.rb'
require_relative 'grid_mover.rb'

#Getting user input:
size = 0
while size < 1
  puts "Enter dimension of the Grid (>=1): "
  size = gets.to_i
end

#Creating objects
home = Point.new(size, size)
skippy = Kangaroo.new
grid = Grid.new(size)
my_die = Die.new

#Running simulation
while skippy.curr_point != home
  tmp = GridMover.moveKangaroo(my_die.roll_die, skippy.curr_point)

  if grid.is_out_of_bounds?(tmp)
    puts "Oops, hit the boundary: (#{tmp.x_coordinate}, #{tmp.y_coordinate})"

  elsif !grid.is_out_of_bounds?(tmp)
    skippy.hop(tmp)
    puts "Hopped to: (#{skippy.curr_point.x_coordinate}, #{skippy.curr_point.y_coordinate})"
  end
end

#Showing results
puts "Finished in #{skippy.num_hops} hops!", "\n" , my_die.die_statistics_to_string