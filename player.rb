class Player
  attr_accessor :name, :lives

  attr_reader :lives

  def initialize(name)
    @name = name
    @lives = 3
  end

  def subtract_point
    @lives -= 1
  end

end