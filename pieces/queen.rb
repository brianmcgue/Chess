require_relative 'sliding_piece.rb'
class Queen < SlidingPiece
  def initialize(position, color)
    super(position, color)
  end

  def to_s
    color == :black ? '♛' : '♕'
  end
end