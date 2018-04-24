require_relative 'errors.rb'
require_relative 'pieces.rb'

class Board

  attr_reader :board

  def self.make_board

    board = Array.new(8){Array.new(8)}
    (0..7).each do |idx|
        (0..7).each do |idx2|
          # case idx
          # when 0,7
          #   case idx2
          #   when 0,7
          #
          #   end
          # end
          if [0,1,6,7].include?(idx)
            board[idx][idx2] = Piece.new([idx, idx2])
          else
            board[idx][idx2] = NullPiece.new([idx, idx2])
          end
        end
      end
    board[0][0] = Rook.new([0,0])
    board[0][7] = Rook.new([0,7])
    Board.new(board)
  end

  def initialize (board)
    @board = board
  end

  def move_piece(start_pos, end_pos)
    raise NoPieceError.new("There is no piece in that positions") if self[start_pos].is_a?(NullPiece)
    piece = self[start_pos]
    raise ValidMoveError.new("This is not a valid move") unless valid_pos?(end_pos)
    self[end_pos] = self[start_pos]
    self[end_pos] = NullPiece.new(start_pos)
  end

  def valid_pos?(pos)
    pos.all? {|num| num < 8 && num >= 0}
  end

  def [](pos)
    x, y = pos
    @board[x][y]
  end

  def []=(pos, value)
    x, y = pos
    @board[x][y] = value
  end
end
