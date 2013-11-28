require 'colorize'
require_relative 'pieces'
class Board
  attr_reader :grid

  def initialize(set_up_pieces = true)
    @grid = make_grid
    set_pieces if set_up_pieces
  end

  def []=(position,piece)
    @grid[position[0]][position[1]] = piece
  end

  def [](position)
    @grid[position[0]][position[1]]
  end

  def checkmate?(color)
    return false unless in_check?(color)

    pieces.none? do |piece|
      next if piece.color != color
      piece.valid_moves.any?
    end
  end

  def dup
    dupped_board = Board.new(false)
    @grid.each_with_index do |row, row_i|
      row.each_with_index do |piece, col_i|
        next if piece.nil?
        dupped_board[[row_i,col_i]] =
                piece.class.new([row_i,col_i],piece.color,dupped_board)
      end
    end
    dupped_board
  end

  def find_king(color)
    pieces.each do |piece|
      return piece.position if piece.is_a?(King) && piece.color == color
    end
  end

  def in_check?(color)
    king_position = find_king(color)
    pieces.each do |piece|
      next if piece.color == color
      return true if piece.moves.include?(king_position)
    end
    false
  end

  def move(start,finish)
    move!(start,finish) if valid_move?(start,finish)
  end

  def move!(start,finish)
    if self[start].nil?
      raise InvalidMoveError.new "No piece here: #{start}"
    elsif !self[start].moves.include?(finish)
      raise InvalidMoveError.new "Not in list of possible moves."
    end
    self[finish] = self[start]
    self[finish].position = finish
    self[start] = nil
  end

  def pieces
    @grid.flatten.compact
  end

  def to_s
    output = "  a  b  c  d  e  f  g  h \n"
    8.times do |row|
      output += (8-row).to_s
      @grid[row].each_with_index do |piece, i|
        if piece.nil?
          if row.odd? ^ i.odd?
            output += "   ".colorize(:color => :black, :background => :light_white)
          else
            output += "   ".colorize(:color => :black, :background => :white)
          end
        else
          if row.odd? ^ i.odd?
            output += " #{piece.to_s} ".colorize(:color => :black, :background => :light_white)
          else
            output += " #{piece.to_s} ".colorize(:color => :black, :background => :white)
          end
        end
      end
      output += " #{8-row}\n"
    end
    output + '  a  b  c  d  e  f  g  h'
  end

  def valid_move?(start,finish)
    this_piece = self[start]
    unless this_piece.valid_moves.include?(finish)
      raise InvalidMoveError.new "Not a valid move."
    else
      true
    end
  end

  private
  def make_grid
    Array.new(8){Array.new(8){nil}}
  end

  def set_pieces
    pieces = [Rook,Knight,Bishop,Queen,King,Bishop,Knight,Rook]
    pieces.each_with_index do |piece, col|
      [0,7].each do |row|
        if row == 0
          self[[row,col]] = piece.new([row,col], :black, self)
        else
          self[[row,col]] = piece.new([row,col], :white, self)
        end
      end
    end

    [1,6].each do |row|
      8.times do |col|
        if row == 1
          self[[row,col]] = Pawn.new([row,col], :black, self)
        else
          self[[row,col]] = Pawn.new([row,col], :white, self)
        end
      end
    end
  end
end