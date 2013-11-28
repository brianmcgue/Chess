require_relative 'sliding_piece.rb'
class Queen < SlidingPiece
  def move_dirs
    DIAG + VERT
  end

  def to_s
    color == :black ? "\u265B" : "\u2655"
  end
end