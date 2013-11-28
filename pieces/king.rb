require_relative 'stepping_piece.rb'
class King < SteppingPiece
  def move_dirs
    KING
  end

  def to_s
    color == :black ? "\u265A" : "\u2654"
  end
end