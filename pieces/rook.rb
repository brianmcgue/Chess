require_relative 'sliding_piece.rb'
class Rook < SlidingPiece
  def initialize(position, color, board)
    super(position, color, board)
  end

  def move_dirs
    VERT
  end

  def to_s
    color == :black ? "\u265C" : "\u2656"
  end
end