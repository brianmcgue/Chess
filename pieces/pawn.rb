require_relative 'piece.rb'
class Pawn < Piece
  def initialize(position, color, board)
    super(position, color, board)
  end

  def moves

  end

  def move_dirs

  end

  def to_s
    color == :black ? "\u265F" : "\u2659"
  end
end