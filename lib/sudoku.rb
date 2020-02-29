class Sudoku
  attr_accessor :board_string
  ###     The suedocode of each line is written after the code in each line.     ###
  def initialize(board_string)
    @board_string = board_string
    @board = Array.new
    @empty_cells = Array.new
    @blocks_array = [[0, 1, 2], [3, 4, 5], [6, 7, 8]]
  end

  def board_array # The board_array function will convert the puzzle from string to a 2D array.
    i = 0
    9.times do
      self.board.push(self.board_string[i..i + 8].split("").map { |num| num.to_i })
      i += 9
    end
    self.board
  end

  def find_empty_cells # In this function we find the empty positions in the puzzle.
    @board.each_with_index { |row, row_index| row.each_with_index { |col, col_index| @empty_cells << [row_index, col_index] if col == 0 } }
    @empty_cells
  end

  def check_row?(row, number) # It checks if that a number exist in its row.
    !@board[row].include?(number)
  end














end

