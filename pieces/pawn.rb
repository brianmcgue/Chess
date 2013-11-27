require_relative 'piece.rb'
class Pawn < Piece

  def initialize(position, color, board)
    super(position, color, board)
  end

  def moves
    moves = []
    modifier = (@color == :black ? 1 : -1)
    row = (@color == :black ? 1 : 6)
    moves << [@position[0] + 2 * modifier, @position[1]] if @position[0] == row &&
              @board[[@position[0] + 2 * modifier, @position[1]]].nil?
    moves << [@position[0] + modifier, @position[1]] if
              @board[[@position[0] + modifier, @position[1]]].nil?
    moves << [@position[0] + modifier, @position[1] + 1] unless
              @board[[@position[0] + modifier, @position[1] + 1]].nil? ||
              @board[[@position[0] + modifier, @position[1] + 1]].color == @color
    moves << [@position[0] + modifier, @position[1] - 1] unless
              @board[[@position[0] + modifier, @position[1] - 1]].nil? ||
              @board[[@position[0] + modifier, @position[1] - 1]].color == @color
    moves
  end

  def to_s
    color == :black ? "\u265F" : "\u2659"
  end
end