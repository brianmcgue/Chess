require_relative 'piece.rb'
class SteppingPiece < Piece
  KING = [[-1,-1],
          [-1, 0],
          [-1, 1],
          [ 0,-1],
          [ 0, 1],
          [ 1,-1],
          [ 1, 0],
          [ 1, 1]]

  KNIGHT = [[ 2, 1],
            [ 1, 2],
            [-1, 2],
            [-2, 1],
            [-2,-1],
            [-1,-2],
            [ 1,-2],
            [ 2,-1]]

  def moves
    moves = []
    self.move_dirs.each do |dir|
      move = [@position[0] + dir[0], @position[1] + dir[1]]
      moves << move if valid_possible_move?(move)
    end
    moves
  end
end