require_relative 'board.rb'
class Piece
  attr_accessor :position, :color, :board

  def initialize(position, color, board)
    @position, @color, @board = position, color, board
  end

  def in_bounds?(position)
    position.min >= 0 && position.max < 8
  end

  def moves
    raise NotImplementedException.new
  end

  def valid_move?(position)
    return false unless in_bounds?(position)
    piece = @board.grid[position[0]][position[1]]
    unless piece.nil?
      return false if piece.color == @color
    end
    true
  end
end