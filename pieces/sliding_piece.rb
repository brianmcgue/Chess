require_relative 'piece.rb'
class SlidingPiece < Piece
  DIAG = [[ 1, 1],
          [-1,-1],
          [-1, 1],
          [ 1,-1]]
  VERT = [[ 1, 0],
          [ 0, 1],
          [-1, 0],
          [ 0,-1]]

  def initialize(position, color, board)
    super(position, color, board)
  end

  def moves
    moves = []
    self.move_dirs.each do |dir|
      multiplier = 1
      loop do
        move = [@position[0] + (dir[0] * multiplier),
        @position[1] + (dir[1] * multiplier)]

        if valid_move?(move)
          moves << move
          break unless @board[move[0]][move[1]].nil?
        else
          break
        end
        multiplier += 1
      end
    end
    moves
  end
end