require_relative 'piece.rb'
class Pawn < Piece

  def initialize(position, color, board)
    super(position, color, board)
  end

  def moves
    moves = []
    modifier = (@color == :black ? 1 : -1)
    row = (@color == :black ? 1 : 6)
    moves << [ 0, 2 * modifier] if @position[0] == row &&
                                  @board.grid[0][2 * modifier].nil?
    moves << [ 0, 1 * modifier] if @board.grid[0][1 * modifier].nil?
    moves << [ 1, 1 * modifier] unless @board.grid[ 1][1 * modifier].nil? ||
                                  @board.grid[ 1][1 * modifier].color == @color
    moves << [-1, 1 * modifier] unless @board.grid[-1][1 * modifier].nil? ||
                                  @board.grid[ 1][1 * modifier].color == @color
    moves
  end

  def to_s
    color == :black ? "\u265F" : "\u2659"
  end
end