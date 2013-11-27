require_relative 'stepping_piece.rb'
class King < SteppingPiece
  def initialize(position, color, board)
    super(position, color, board)
  end

  def move_dirs
    KING
  end

  def to_s
    color == :black ? "\u265A" : "\u2654"
  end
end