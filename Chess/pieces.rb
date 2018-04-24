require_relative "sliding_piece.rb"
require_relative "stepping_piece.rb"
require_relative "board.rb"

class Piece

  def initialize(position)
    @position = position
  end

  def to_s
    :P
  end


end

class NullPiece < Piece
  def initialize(position)
    super
  end

  def to_s
    :_
  end


end

class Rook < Piece
  include SlidingPiece
  def initialize(position)
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
  def initialize(position)
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
  def initialize(position)
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
