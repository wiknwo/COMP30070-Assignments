class Player
  def initialize(name, prof, min_desired_prof)
    @name = name

    if prof < 1 || prof > 10
      raise ArgumentError.new('proficiency must be in range 1..10')
    end
    @proficiency = prof

    if min_desired_prof < 1 || min_desired_prof > 10
      raise ArgumentError.new('minimum desired proficiency must be in range 1..10')
    end
    @minimum_desired_proficiency = min_desired_prof
  end

  def <=>(other)
    self.proficiency <=> other.proficiency
  end

  def satisfaction(other)
    if other.proficiency >= self.minimum_desired_proficiency
      return 0.0
    else return other.proficiency - self.minimum_desired_proficiency
    end
  end

  attr_reader :name, :minimum_desired_proficiency, :proficiency
end