require_relative 'piece.rb'
class Pawn < Piece
  def initialize(position, color)
    super(position, color)
  end

  def to_s
    color == :black ? "\u265F" : "\u2659"
  end
end