require 'colorize'
require_relative 'cursor.rb'
require_relative 'board.rb'

class Display
  attr_reader :board
  def initialize(board)
    @cursor = Cursor.new([0,0], board)
    @board = board
  end

  def render

    while true
      system "clear"
    # puts "-------------------------------"
    @board.board.each_with_index do |row,idx1|

      row.each_with_index do |tile, idx2|
        str = tile.to_s

        if @cursor.cursor_pos == [idx1, idx2]
          print " #{str} ".colorize(:color => :yellow,:background => :blue)
        elsif (idx1 + idx2).even?
          print " #{str} ".colorize(:color => :black, :background => :white)
        else
          print " #{str} ".colorize(:color => :white, :background => :black) 
        end
      end
      puts ""

    end

    @cursor.get_input
  end
  end
end
