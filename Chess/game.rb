require_relative 'board.rb'
require_relative 'display.rb'
require_relative 'pieces.rb'

brd = Board.make_board
dsp = Display.new(brd)
#
while true
  dsp.render
  # old_select = dsp.cursor.selected
  # if dsp.cursor.selected.class != NullPiece &&  dsp.cursor.selected.class != NilClass
  #      board_pos = brd[dsp.cursor.get_input]
  #      if board_pos.class == NullPiece
  #        brd.move_piece(old_select.position,dsp.cursor.get_input)
  #        dsp.render
  #      end
  # end
  obj = dsp.cursor.get_input


end

# rk = Rook.new([0,0], brd)
# p rk.horizontal_dirs
# p rk.poss_moves_in_dir([1,0])
# p rk.moves
