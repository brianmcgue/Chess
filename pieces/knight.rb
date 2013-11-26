require_relative 'stepping_piece.rb'
class Knight < SteppingPiece
  def initialize(position, color)
    super(position, color)
  end

  def to_s
    color == :black ? "\u265E" : "\u2658"
  end
end