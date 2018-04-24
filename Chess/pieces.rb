require_relative "sliding_piece.rb"
require_relative "stepping_piece.rb"
require_relative "board.rb"
require 'singleton'

class Piece
  attr_reader :position
  def initialize(position, board)
    @position = position
    @board = board
  end

  def to_s
    :P
  end

  def update_pos(pos)
    @position = pos
  end

end

class NullPiece < Piece
  include Singleton
  def initialize
    
  end

  def to_s
    :_
  end


end

class Rook < Piece
  include SlidingPiece
  def initialize(position, board)
    super
  end

  def to_s
    :R
  end

  protected

  def move_dir
    :horizonal
  end


end

class Bishop < Piece
  include SlidingPiece
  def initialize(position, board)
    super
  end

  def to_s
    :B
  end

  protected
  def move_dir
    :diagonal
  end
end

class Queen < Piece
  include SlidingPiece
  def initialize(position, board)
    super
  end

  def to_s
    :Q
  end

  protected
  def move_dir
    :all
  end
end

class King < Piece
  include SteppingPiece
  def initialize(position, board)
    super
  end

  def to_s
    :K
  end

end

class Knight < Piece
  include SteppingPiece
  def initialize(position, board)
    super
  end

  def to_s
    :N
  end

end
