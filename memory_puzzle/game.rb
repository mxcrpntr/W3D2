require_relative "board"
require_relative "card"
require_relative "player"


class Game
  def initialize(size,name)
    @board = Board.new(size)
    @player = Player.new(name)
  end
  def play
    @board.populate
    while !@board.won?
      # first guess
      pos1 = @player.get_pos
      row1, col1 = pos1
      while !@board.valid_pos?(pos1) || @board.grid[row1][col1].face_up == true
        puts "Not a valid position."
        pos1 = @player.get_pos
        row1, col1 = pos1
      end
      @board.reveal(pos1)
      @board.render
      # second guess
      pos2 = @player.get_pos
      row2, col2 = pos2
      while !@board.valid_pos?(pos2) || pos1 == pos2 || @board.grid[row2][col2].face_up == true
        puts "Not a valid position."
        pos2 = @player.get_pos
        row2, col2 = pos2
      end
      @board.reveal(pos2)
      @board.render
      # compare guesses
      if @board.grid[row1][col1].face_value == @board.grid[row2][col2].face_value
        puts "Congrats, you've got a match!"
      else
        @board.grid[row1][col1].hide
        @board.grid[row2][col2].hide
      end
      @player.guesses += 1
    end
    puts "You won the game in #{@player.guesses} guesses! Congrats!"
  end
end