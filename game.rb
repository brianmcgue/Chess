require_relative 'board.rb'
class Game
  attr_accessor :turn

  def initialize
    @board = Board.new
    @turn = :white
    play
  end

  private
  def play
    until @board.checkmate?(@turn)
      play_turn
      @turn == :white ? :black : :white
    end
    puts "Checkmate! #{@turn} wins!"
  end

  def play_turn

  end
end