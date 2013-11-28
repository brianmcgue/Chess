require_relative 'stepping_piece.rb'
class Knight < SteppingPiece
  def move_dirs
    KNIGHT
  end

  def to_s
    color == :black ? "\u265E" : "\u2658"
  end
end