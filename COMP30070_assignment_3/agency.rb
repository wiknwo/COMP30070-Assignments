module Optimizable
  def steepest_ascent_hill_climb
    current_state_eval = initial_state_eval
    neighbours_evals = generate_neighbour_states_evals
    local_best_state_eval = pick_best_neighbour_state_eval(neighbours_evals)

    if local_best_state_eval < current_state_eval
      current_state_eval
    else
      apply_operation_to_move_to_local_best_state(neighbours_evals)
      steepest_ascent_hill_climb
    end
  end
end

class Agency
  include Optimizable

  def initialize
    @women_players, @men_players = [], []
  end

  def add_women_player(woman_player)
    @women_players << woman_player
  end

  def add_men_player(man_player)
    @men_players << man_player
  end

  def to_s
    output_str = "MALE Players:\n"
    @men_players.each {|player| output_str += "#{player.name}, proficiency: #{player.proficiency}, seeks proficiency >= #{player.minimum_desired_proficiency}.\n"}
    output_str += "FEMALE Players:\n"
    @women_players.each {|player| output_str += "#{player.name}, proficiency: #{player.proficiency}, seeks proficiency >= #{player.minimum_desired_proficiency}.\n"}
    output_str
  end

  def create_teams
    @men_players.sort!
    @women_players.sort!
    @teams = []
    @women_players.length.times{|i| @teams << [@women_players[i], @men_players[i]]}
  end

  def teams_to_s
    @teams.inject(""){|output_str, team| output_str += "(#{team[0].name}, #{team[1].name}) Satisfaction: #{(team[0].satisfaction(team[1]) + team[1].satisfaction(team[0]).to_f) / 2}\n"}
  end

  def each_player
    @men_players.each{|player| yield player}
    @women_players.each{|player| yield player}
  end

  def fitness
    @teams.inject(0){|sum, team| sum += (team[0].satisfaction(team[1]) + team[1].satisfaction(team[0]).to_f) / 2}
  end

  def initial_state_eval
    fitness
  end

  def generate_neighbour_states_evals
    fitness_after_swap = []
    (0...@teams.length).each do |i|
      @teams[i][1], @teams[(i + 1) % @teams.length][1] = @teams[(i + 1) % @teams.length][1], @teams[i][1]
      fitness_after_swap << fitness
      @teams[i][1], @teams[(i + 1) % @teams.length][1] = @teams[(i + 1) % @teams.length][1], @teams[i][1]
    end
    fitness_after_swap
  end

  def pick_best_neighbour_state_eval(neighbours_evals)
    neighbours_evals.max
  end

  def apply_operation_to_move_to_local_best_state(neighbours_evals)
    best_swap = neighbours_evals.index(neighbours_evals.max)
    @teams[best_swap][1], @teams[(best_swap + 1) % @teams.length][1] = @teams[(best_swap + 1) % @teams.length][1], @teams[best_swap][1]
  end

  private :fitness, :initial_state_eval, :generate_neighbour_states_evals, :apply_operation_to_move_to_local_best_state, :pick_best_neighbour_state_eval
end