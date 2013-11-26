require_relative 'sliding_piece.rb'
class Bishop < SlidingPiece
  def initialize(position, color)
    super(position, color)
  end

  def to_s
    color == :black ? "\u265D" : "\u2657"
  end
end