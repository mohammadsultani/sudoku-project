class Sudoku
    attr_accessor :board_string
    ###     The suedocode of each line is written after the code in each line.     ###
    def initialize(board_string)
      @board_string = board_string
      @board = Array.new
      @empty_cells = Array.new
      @blocks_array = [[0, 1, 2], [3, 4, 5], [6, 7, 8]]
    end
end
