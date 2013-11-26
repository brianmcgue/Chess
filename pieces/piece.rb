class Piece
  attr_accessor :position, :color

  def initialize(position, color)
    @position, @color = position, color
  end

  def moves
    raise NotImplementedException.new
  end
end