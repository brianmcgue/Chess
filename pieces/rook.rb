require_relative 'sliding_piece.rb'
class Rook < SlidingPiece
  def initialize(position, color)
    super(position, color)
  end

  def to_s
    color == :black ? "\u265C" : "\u2656"
  end
end