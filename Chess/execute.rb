require_relative 'board.rb'
require_relative 'display.rb'

brd = Board.make_board
dsp = Display.new(brd)
dsp.render
