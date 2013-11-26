require_relative "pieces"
class Board

  def initialize
    @grid = make_grid
    set_pieces
  end

  def to_s
    output = '  a b c d e f g h\n'
    8.times do |row|
      output += (8-row).to_s
      @grid[row].each do |piece|
        if piece.nil?
          output += '_'
        else
          output += ' ' + piece.to_s
        end
      end
      output += " #{8-row}\n"
    end
    output + '  a b c d e f g h'
  end

  private
  def make_grid
    Array.new(8){Array.new(8){nil}}
  end

  def set_pieces
    pieces = [Rook,Knight,Bishop,Queen,King,Bishop,Knight,Rook]
    pieces.each_with_index do |piece, col|
      [0,7].each do |row|
        if row == 0
          @grid[row][col] = piece.new([row,col], :black)
        else
          @grid[row][col] = piece.new([row,col], :white)
        end
      end
    end

    [1,6].each do |row|
      8.times do |col|
        if row == 1
          @grid[row][col] = Pawn.new([row,col], :black)
        else
          @grid[row][col] = Pawn.new([row,col], :white)
        end
      end
    end
  end
end

board = Board.new
puts board