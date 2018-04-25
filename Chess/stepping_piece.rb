module SteppingPiece

  def moves
    direction = self.class
    mov = []
    if direction == Knight
      mov += knight_dirs
    else direction == king_dirs
      mov += king_dirs
    end
    mov
  end

  def knight_dirs
    knight =[]
    diffs = [[2,1],[ 1,2],
          [-1,2],
          [-2,1],
          [-2,-1],
          [-1,-2],
          [1,-2],
          [2,-1]]
    diffs.each do |diff|
      next_one = next_loc(@position, diff)
      knight << next_one if valid_move?(next_one)
    end

    knight

  end

  def king_dirs
    #return all valid diagonal pos's
    king =[]
    (-1..1). each do |idx1|
      (-1..1).each do |idx2|
        next if idx1 == 0 && idx2 == 0
        diff = [idx1, idx2]
        next_one = next_loc(@position, diff)
        king << next_one if valid_move?(next_one)
      end
    end
    king
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

  private
  def move_dir

  end


end
