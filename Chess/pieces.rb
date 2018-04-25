require_relative "sliding_piece.rb"
require_relative "stepping_piece.rb"
require_relative "board.rb"
require 'singleton'
require 'byebug'

class Piece
  attr_reader :position
  def initialize(position, board)
    @position = position
    @board = board
  end

  def to_s

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

class Pawn < Piece
  attr_reader :dir
  def initialize(position, board, dir)
    super(position, board)
    @dir = dir
  end

  def to_s
    :P
  end

  def moves

    mov = []
    next_pos = next_loc(@position, dir)
    mov << next_pos if valid_move?(next_pos)
    mov
  end

  def next_loc(loc, diff)

    [loc[0] + diff[0], loc[1] + diff[1]]
  end

  def valid_move?(pos)

    # at_pos = @board[pos]
    # @board.valid_pos?(pos) && at_pos.class == NullPiece
    if @board.valid_pos?(pos)
      at_pos = @board[pos]
      return true if at_pos.class == NullPiece
    end
    false
  end


end
