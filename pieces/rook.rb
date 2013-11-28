require_relative 'sliding_piece.rb'
class Rook < SlidingPiece
  def move_dirs
    VERT
  end

  def to_s
    color == :black ? "\u265C" : "\u2656"
  end
end