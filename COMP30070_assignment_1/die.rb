class Die
  #North = 1, South = 2, East = 3, West = 4

  def initialize
    @total_num_throws = 0
    @num_throws_in_each_direction = {'North' => 0, 'South' => 0, 'East' => 0, 'West' => 0}
  end

  def roll_die
    @die = 1 + rand(4) #roll the die
    @total_num_throws += 1

    case @die
    when 1 then @num_throws_in_each_direction['North'] += 1
    when 2 then @num_throws_in_each_direction['South'] += 1
    when 3 then @num_throws_in_each_direction['East'] += 1
    when 4 then @num_throws_in_each_direction['West'] += 1
    end

    @die #Return the face value of the die.
  end
  
  def die_statistics_to_string
    output_str = "Die Statistics:\n" + "Total throws:: #{@total_num_throws}\n"
    @num_throws_in_each_direction.each { |key, value| output_str += "#{key}: #{'%.2f' % ((value.to_f / @total_num_throws) * 100)}% " }
    output_str #Return output string
  end
end