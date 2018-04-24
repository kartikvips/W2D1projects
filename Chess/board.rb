require_relative 'errors.rb'
require_relative 'pieces.rb'
require 'byebug'

class Board

  attr_reader :board

  def self.make_board

    board = Array.new(8){Array.new(8)}
    Board.new(board)
  end

  def initialize (board)
    @board = board
    add_pieces
  end

  def add_pieces
    (0..7).each do |idx|
        (0..7).each do |idx2|
          # case idx
          # when 0,7
          #   case idx2
          #   when 0,7
          #
          #   end
          # end
          if [0,7].include?(idx)
            @board[idx][idx2] = Piece.new([idx, idx2], self)
          else
            @board[idx][idx2] = NullPiece.instance
          end
        end
      end
      @board[0][0] = Rook.new([0,0], self)
      @board[0][7] = Rook.new([0,7], self)
      @board[0][1] = Knight.new([0,1], self)
      @board[0][6] = Knight.new([0,6], self)
      @board[0][2] = Bishop.new([0,2], self)
      @board[0][5] = Bishop.new([0,5], self)
      @board[0][3] = Queen.new([0,3], self)
      @board[0][4] = King.new([0,4], self)

      @board[7][0] = Rook.new([7,0], self)
      @board[7][7] = Rook.new([7,7], self)
      @board[7][1] = Knight.new([7,1], self)
      @board[7][6] = Knight.new([7,6], self)
      @board[7][2] = Bishop.new([7,2], self)
      @board[7][5] = Bishop.new([7,5], self)
      @board[7][3] = Queen.new([7,3], self)
      @board[7][4] = King.new([7,4], self)
  end

  def move_piece(start_pos, end_pos)
    piece = self[start_pos]
    raise ValidMoveError.new("This is not a valid move") unless valid_pos?(end_pos)
    piece.update_pos(end_pos)
    self[end_pos] = self[start_pos]
    # self[start_pos] = NullPiece.new(start_pos, self)
    self[start_pos] = NullPiece.instance
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
