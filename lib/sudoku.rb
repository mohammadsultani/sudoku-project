class Sudoku
  attr_accessor :board_string, :board, :empty_cells, :blocks_array

  def initialize(board_string)
    self.board_string = board_string
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
    # Returns a string representing the current state of the board, well formatted for output to the screen. No `puts` here!
  end

  def find_empty_cells # In this function we find the empty positions in the puzzle.
    self.board.each_with_index { |row, row_index| row.each_with_index { |col, col_index| self.empty_cells << [row_index, col_index] if col == 0 } }
    self.empty_cells
  end

  def check_row?(row, number) # It checks if that a number exist in its row.
    !self.board[row].include?(number)
  end

  def check_col?(col, number) # It checks the column for a given number.
    self.board.each { |el| return false if el[col] == number }
    true
  end

  def check_block?(row, col, number) # Here we check if the number exist in its block.
    row_array = self.blocks_array.find { |el| el.include?(row) } # Is it in the row?
    col_array = self.blocks_array.find { |el| el.include?(col) } # Is it in the Column?
    row_array.each { |row| col_array.each { |col| return false if self.board[row][col] == number } } # How about the block it self?
    true
  end

  def is_number_valid?(row, col, number) # Here we combine the last three function to see if a number is valid.
    check_row?(row, number) && check_col?(col, number) && check_block?(row, col, number)
  end

  def fill_board # Here is where we actually solve the puzzle using a backtracking algorithm.
    i = 0
    while i < self.empty_cells.length # We limit the loop to the Empty_cells array.
      row = self.empty_cells[i][0] # Assigning row to first row value in empty cells array.
      column = self.empty_cells[i][1] #Assigning column to first column in empty_cells array.
      number = self.board[row][column] + 1 #The first number that we try is 1.
      valid = false # A variable to tarck the validity of number.
      while !valid && number <= 9
        if is_number_valid?(row, column, number) # Here the function will guide us to an anwer.
          valid = true # It can be true or false depending on the number.
          self.board[row][column] = number # If true than we assign the fisrt empty cell to 1
          i += 1
        else
          number += 1 # If no than we try another number.
        end
      end
      if !valid # if all the number is not valid than it will
        self.board[row][column] = 0 # change it back to 0.
        i -= 1 # Then it reverse back to last reassinged cell and change it.
      end
    end
    self.board # At end, after backtracking process ends. it give us the solved board.
  end

  def solvepuzzle # This function just recall the previouse functions.
    start = Time.now
    board_array
    find_empty_cells
    fill_board
    finish = Time.now
    dif = finish - start # It shows the time taken for solving each puzzle.
  end

  # Returns a boolean indicating whether or not the provided board is solved.
  def finished?
    !@board.all? { |row| row.include?(0) }
  end

  # Returns a string representing the current state of the board, well formatted for output to the screen. No `puts` here!
  def to_s # The function display solved puzzles in the screen.
    board = @board.join.to_s # It convert the board to a string.
    i = 9
    while i < board.length # Using a loop the board is devided in to 9 lines.
      board.insert(i, "\n")
      i += 10
    end
    i = 1
    while i < board.length # This loop create 2 spaces between each number.
      board.insert(i, "  ")
      i += 3
    end
    board.insert(0, "  ")
    board # Finally The solved puzzle is ready to print.
  end

end
###     Run the runner file in the terminal to see the sloved puzzles.     ###
