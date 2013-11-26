require_relative 'stepping_piece.rb'
class King < SteppingPiece
  def initialize(position, color)
    super(position, color)
  end

  def to_s
    color == :black ? "\u265A" : "\u2654"
  end
end