require_relative 'player.rb'
require_relative 'agency.rb'

mixed_doubles_tennis = Agency.new
file = File.new('women.txt')
file.each do |line|
  data = line.split
  mixed_doubles_tennis.add_women_player(Player.new(data[0], data[1].to_i, data[2].to_i))
end
file = File.new('men.txt')
file.each do |line|
  data = line.split
  mixed_doubles_tennis.add_men_player(Player.new(data[0], data[1].to_i, data[2].to_i))
end
puts mixed_doubles_tennis.to_s
mixed_doubles_tennis.create_teams
puts mixed_doubles_tennis.teams_to_s
mixed_doubles_tennis.each_player {|player| if player.proficiency >= 9 then puts player.name end}
puts mixed_doubles_tennis.steepest_ascent_hill_climb
puts mixed_doubles_tennis.teams_to_s
