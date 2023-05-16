require_relative "tile"

class Board
  def initialize(grid)
    @grid = grid
    @squares = Array.new(9) {Array.new(0)}
    
  end
  def self.from_file(file_name)
    array = []
    rows = File.readlines(file_name).map(&:chomp)
    rows.each do |row|
      new_row = row.split("").map {|el| Tile.new(el.to_i)}
      array << new_row
    end
    array
  end
  def add_value(pos,val)
    if valid_pos?(pos)
      row, col = pos
      @grid[row][col] = val
    else
      raise "not a valid position"
    end
  end
  def valid_pos?(pos)
    row, col = pos
    return (row < 9 && col < 9) && (row >= 0 && col >= 0)
  end
  def render
    @grid.each_with_index do |row,i|
      row.each_with_index do |tile,j|
        print tile.to_s
        print "|" if j != 8
      end
      print "\n"
      print "-+-+-+-+-+-+-+-+-\n" if i != 8
    end
  end
  def solved?
    @grid.each do |row|
      return false if row.any? {|tile| tile.value == 0}
    end
    return true
  end
  def row_solved?(row)

  end
end