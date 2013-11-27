class Piece
  attr_accessor :position, :color, :board

  def initialize(position, color, board)
    @position, @color, @board = position, color, board
  end

  def in_bounds?(position)
    position.min >= 0 && position.max < 8
  end

  def move_in_check?(finish)
    board_copy = @board.dup
    board_copy.move!(@position, finish)
    board_copy.in_check?(@color)
  end

  def moves
    raise NotImplementedException.new
  end

  def valid_possible_move?(position)
    return false unless in_bounds?(position)
    piece = @board[position]
    unless piece.nil?
      return false if piece.color == @color
    end
    true
  end

  def valid_moves
    possible_moves = moves
    possible_moves.select { |position| !move_in_check?(position) }
  end
end