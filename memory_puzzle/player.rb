class Player
  attr_reader :name
  attr_accessor :guesses
  def initialize(name)
    @name = name
    @guesses = 0
  end
  def get_pos
    print "Enter a valid position as two numbers separated by a space: "
    pos = gets.chomp.split(" ")
    pos[0], pos[1] = pos[0].to_i, pos[1].to_i
  end
end