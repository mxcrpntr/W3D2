require_relative "card"

class Board
    attr_reader :grid
    def initialize(size)
      if size.odd? || size <= 0
        raise "size must be even and greater than zero"
      end
        @size = size
        @grid = Array.new(size) {Array.new(size)}
        @cards=[]
    end
    def populate
      # create an array of possible card symbols
      alpha_sym=(:A..:Z).to_a
      # create a correctly-sized array of symbols we will use
      card_syms = []
      (@size*@size/2).times do
          sample = alpha_sym.sample
          while card_syms.include?(sample)
              sample = alpha_sym.sample
          end
          card_syms << sample
      end
      # populate the deck with the chosen symbols
      card_syms.each do |sym|
        @cards << Card.new(sym)
        @cards << Card.new(sym)
      end
      # populate the grid with the deck
      @cards.each do |card|
          rand_row = rand(0...@size)
          rand_col = rand(0...@size)
          while @grid[rand_row][rand_col] != nil  
            rand_row = rand(0...@size)
            rand_col = rand(0...@size)
          end
          @grid[rand_row][rand_col] = card
      end
    end
    def won?
      @grid.flatten.all? {|card| card.face_up == true}
    end
    def valid_pos?(pos)
      row, col = pos
      return (row < @size && col < @size) && (row >= 0 && col >= 0)
    end
    def reveal(pos)
      row,col=pos
      @grid[row][col].reveal
      return  @grid[row][col].face_value
    end
    def render
      print "  " + (0...@size).to_a.join(" ") + "\n"
      @grid.each_with_index do |row,i|
        print i.to_s + " "
        row.each do |card|
          if card.face_up == true
            print card.face_value
          else
            print " "
          end
          print " "
        end
        print "\n"
      end
    end
end

