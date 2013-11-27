require_relative 'pieces'
class Board
  attr_reader :grid

  def initialize(set_up_pieces = true)
    @grid = make_grid
    set_pieces if set_up_pieces
  end

  def checkmate?(color)
    return false unless in_check?(color)

    @grid.flatten.none? do |piece|
      next if piece.nil? || piece.color != color
      piece.valid_moves.any?
    end
  end

  def dup
    dupped_board = Board.new(false)
    @grid.each_with_index do |row, row_i|
      row.each_with_index do |piece, col_i|
        next if piece.nil?
        dupped_board.grid[row_i][col_i] =
                piece.class.new([row_i,col_i],piece.color,dupped_board)
      end
    end
    dupped_board
  end

  def find_king(color)
    @grid.flatten.each do |piece|
      return piece.position if piece.is_a?(King) && piece.color == color
    end
  end

  def in_check?(color)
    king_position = find_king(color)
    @grid.flatten.each do |piece|
      next if piece.nil? || piece.color == color
      return true if piece.moves.include?(king_position)
    end
    false
  end

  def move(start,finish)
    begin
      move!(start,finish) if valid_move?(start,finish)
    rescue InvalidMoveError => e
      puts "Invalid Move: #{e.message}"
    end
  end

  def move!(start,finish)
    if @grid[start[0]][start[1]].nil?
      raise InvalidMoveError.new "No piece here."
    elsif !@grid[start[0]][start[1]].moves.include?(finish)
      raise InvalidMoveError.new "Not in list of possible moves."
    end
    # @grid[finish[0]][finish[1]].position = nil unless @grid[finish[0]][finish[1]].nil?
    @grid[finish[0]][finish[1]] = @grid[start[0]][start[1]]
    @grid[finish[0]][finish[1]].position = finish
    @grid[start[0]][start[1]] = nil
  end

  def to_s
    output = "  a b c d e f g h\n"
    8.times do |row|
      output += (8-row).to_s
      @grid[row].each_with_index do |piece, i|
        if piece.nil?
          output += " _"
        else
          output += " #{piece.to_s}"
        end
      end
      output += " #{8-row}\n"
    end
    output + '  a b c d e f g h'
  end

  def valid_move?(start,finish)
    this_piece = @grid[start[0]][start[1]]
    this_piece.valid_moves.include?(finish)
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
          @grid[row][col] = piece.new([row,col], :black, self)
        else
          @grid[row][col] = piece.new([row,col], :white, self)
        end
      end
    end

    [1,6].each do |row|
      8.times do |col|
        if row == 1
          @grid[row][col] = Pawn.new([row,col], :black, self)
        else
          @grid[row][col] = Pawn.new([row,col], :white, self)
        end
      end
    end
  end
end

board = Board.new
puts board
board.move([6,5],[5,5])
puts board
board.move([1,4],[3,4])
puts board
board.move([6,6],[4,6])
puts board
board.move([0,3],[4,7])
puts board
p board.checkmate?(:white)
#
# puts board

#
# puts board
# board.move([0,6],[2,7])
# puts board
