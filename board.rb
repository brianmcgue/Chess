require_relative 'pieces'
class Board

  def initialize
    @grid = make_grid
    set_pieces
  end

  def find_king(color)
    @grid.each do |row|
      row.each do |piece|
        return piece.position if piece.is_a?(King) && piece.color == color
      end
    end
  end

  def in_check?(color)
    king_position = find_king(color)
    @grid.each do |row|
      row.each do |piece|
        next if piece.color == color
        return true if piece.moves.include?(king_position)
      end
    end
    false
  end

  def move(start,finish)
    raise "No piece here." if @grid[start[0]][start[1]].nil?
    raise "Not valid move." unless @grid[start[0]][start[1]].moves.include?(finish)
    # @grid[finish[0]][finish[1]].position = nil unless @grid[finish[0]][finish[1]].nil?
    @grid[finish[0]][finish[1]] = @grid[start[0]][start[1]]
    @grid[finish[0]][finish[1]].position = finish
    @grid[start[0]][start[1]] = nil
  end

  def to_s
    output = "  a b c d e f g h\n"
    8.times do |row|
      output += (8-row).to_s
      @grid[row].each do |piece|
        if piece.nil?
          output += ' _'
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
          @grid[row][col] = piece.new([row,col], :black, @board)
        else
          @grid[row][col] = piece.new([row,col], :white, @board)
        end
      end
    end

    [1,6].each do |row|
      8.times do |col|
        if row == 1
          @grid[row][col] = Pawn.new([row,col], :black, @board)
        else
          @grid[row][col] = Pawn.new([row,col], :white, @board)
        end
      end
    end
  end
end

board = Board.new
puts board