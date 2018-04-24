module SlidingPiece

  def moves
    case move_dir
    when :horizontal
      horizontal_dirs
    when :diagonal
      diagonal_dirs
    when :all
      horizontal_dirs + diagonal_dirs
    end
  end



  def horizontal_dirs

  end

  def diagonal_dirs
    #return all valid diagonal pos's
  end



  def move_dir

  end

end
