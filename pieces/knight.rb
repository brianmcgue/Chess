require_relative 'stepping_piece.rb'
class Knight < SteppingPiece
  def initialize(position, color, board)
    super(position, color, board)
  end

  def move_dirs

  end

  def to_s
    color == :black ? "\u265E" : "\u2658"
  end
end