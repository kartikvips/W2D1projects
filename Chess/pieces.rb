class Piece

  def initialize(position)
    @position = position
  end

  def valid_pos?(pos,board)
    return false if board[pos[0]][pos[1]].class == Piece
    true
  end

end

class NullPiece < Piece
  def initialize(position)
    super
  end
end
