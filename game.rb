require_relative 'board.rb'
class Game
  attr_accessor :turn

  def initialize
    @board = Board.new
    @turn = :white
    play
  end

  def convert_input(input)
    convert = { 'a' => 0,
                'b' => 1,
                'c' => 2,
                'd' => 3,
                'e' => 4,
                'f' => 5,
                'g' => 6,
                'h' => 7 }

    input_arr = input.split('')
    position = [ 8-Integer(input_arr[1]), convert[input_arr[0]] ]
  end

  private
  def get_input
    puts @board
    begin
      puts "#{@turn.to_s.capitalize}, pick a piece to move:"
      start = gets.chomp.downcase
      puts "#{@turn.to_s.capitalize}, pick a tile to move to:"
      finish = gets.chomp.downcase
      unless (start =~ /^[a-h][1-8]$/) && (finish =~ /^[a-h][1-8]$/)
        raise InvalidMoveError.new "format should be '(letter)(number)' eg. f7"
      end
    rescue InvalidMoveError => e
      puts "Invalid Move: #{e.message}"
      retry
    end
    *start_finish = convert_input(start), convert_input(finish)
  end

  def play
    until @board.checkmate?(@turn)
      play_turn
      @turn = (@turn == :white ? :black : :white)
    end
    puts @board
    puts "Checkmate! #{@turn.to_s.capitalize} wins!"
  end

  def play_turn
    begin
      *start_finish = get_input
      start, finish = *start_finish
      if @board[start].nil?
        raise InvalidMoveError.new "No piece at #{start}."
      elsif @board[start].color != @turn
        raise InvalidMoveError.new "Cannot move an opponent's piece!"
      elsif start == finish
        raise InvalidMoveError.new "Cannot move to starting position!"
      end
      @board.move(*start_finish)
    rescue InvalidMoveError => e
      puts "Invalid Move: #{e.message}"
      retry
    end
  end
end

Game.new