require 'byebug'
module SlidingPiece

  def moves
    direction = self.class
    p direction
    mov = []
    if direction == Rook
      mov += horizontal_dirs
    elsif direction == Bishop
      mov += diagonal_dirs
    elsif direction == Queen
      mov = mov +horizontal_dirs + diagonal_dirs
    end
    mov
  end



  def horizontal_dirs
    horiz =[]
    horiz += poss_moves_in_dir([1,0])
    horiz += poss_moves_in_dir([0,1])
    horiz += poss_moves_in_dir([-1,0])
    horiz += poss_moves_in_dir([0,-1])

  end

  def diagonal_dirs
    #return all valid diagonal pos's
    diag =[]
    diag += poss_moves_in_dir([1,1])
    diag += poss_moves_in_dir([-1,1])
    diag += poss_moves_in_dir([-1,-1])
    diag += poss_moves_in_dir([1,-1])
  end


  def poss_moves_in_dir(dir)

    poss_moves = []
    new_pos = next_loc(@position, dir)
    while valid_move?(new_pos)
      poss_moves << new_pos
      new_pos = next_loc(new_pos, dir)
    end
    poss_moves
  end

  def next_loc(loc, diff)
    [loc[0] + diff[0], loc[1] + diff[1]]
  end

  def valid_move?(pos)
    # debugger'
    if @board.valid_pos?(pos)
      at_pos = @board[pos]
      return at_pos.class == NullPiece
    end
    false
  end

  private
  def move_dir

  end

end
