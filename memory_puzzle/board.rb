require_relative "card"

class Board
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
      @grid.all? {|card| card.face_up?}
    end
    def reveal(pos)
      row,col=pos
      @grid[row][col].reveal
      return  @grid[row][col].face_value
    end
    def render
      @grid.each do |row|
        row.each do |card|
          if card.face_up?
            print card.to_s
          else
            print "  "
          end
          print "  "
        end
        print "/n"
      end
    end
end

