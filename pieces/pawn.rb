require_relative 'piece.rb'
class Pawn < Piece

  def moves
    moves = []
    mod = (@color == :black ? 1 : -1)
    row = (@color == :black ? 1 : 6)
    x, y = @position[0], @position[1]
    moves << [x + 2 * mod, y] if x == row && @board[[x + 1 * mod, y]].nil? &&
              @board[[x + 2 * mod, y]].nil?
    moves << [x + mod, y] if @board[[x + mod, y]].nil?
    moves << [x + mod, y + 1] unless @board[[x + mod, y + 1]].nil? ||
              @board[[x + mod, y + 1]].color == @color
    moves << [x + mod, y - 1] unless @board[[x + mod, y - 1]].nil? ||
              @board[[x + mod, y - 1]].color == @color
    moves
  end

  def to_s
    color == :black ? "\u265F" : "\u2659"
  end
end