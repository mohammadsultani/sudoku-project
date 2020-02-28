require "sudoku"

describe "sudoku:" do
  describe "board array" do
    it "should return a sudoku array by the given string" do
      mock = Sudoku.new("1-58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--")
      expect(mock.board_array).to eq([[1, 0, 5, 8, 0, 2, 0, 0, 0],
                                      [0, 9, 0, 0, 7, 6, 4, 0, 5],
                                      [2, 0, 0, 4, 0, 0, 8, 1, 9],
                                      [0, 1, 9, 0, 0, 7, 3, 0, 6],
                                      [7, 6, 2, 0, 8, 3, 0, 9, 0],
                                      [0, 0, 0, 0, 6, 1, 0, 5, 0],
                                      [0, 0, 7, 6, 0, 0, 0, 3, 0],
                                      [4, 3, 0, 0, 2, 0, 5, 0, 1],
                                      [6, 0, 0, 3, 0, 8, 9, 0, 0]])
    end
  end

  describe "find empty cells" do
    it "should return the position of cells that contain 0" do
      mock = Sudoku.new("1-58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--")
      mock.board_array
      expect(mock.find_empty_cells).to eq([[0, 1], [0, 4], [0, 6], [0, 7], [0, 8], [1, 0], [1, 2], [1, 3], [1, 7], [2, 1], [2, 2], [2, 4], [2, 5], [3, 0], [3, 3], [3, 4], [3, 7], [4, 3], [4, 6], [4, 8], [5, 0], [5, 1], [5, 2], [5, 3], [5, 6], [5, 8], [6, 0], [6, 1], [6, 4], [6, 5], [6, 6], [6, 8], [7, 2], [7, 3], [7, 5], [7, 7], [8, 1], [8, 2], [8, 4], [8, 7], [8, 8]])
    end
  end

  describe "check row?" do
    it "should accept two numbers as args" do
      mock = Sudoku.new("1-58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--")
      mock.board_array
      expect { mock.check_row?(5, 2) }.to_not raise_error
    end

    it "should return false if the number exist in the row otherwise return true" do
      mock = Sudoku.new("1-58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--")
      mock.board_array
      expect(mock.check_row?(3, 7)).to eq(false)
      expect(mock.check_row?(3, 8)).to eq(true)
    end
  end

  describe "check col?" do
    it "should accept two numbers as args" do
      mock = Sudoku.new("1-58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--")
      mock.board_array
      expect { mock.check_col?(5, 1) }.to_not raise_error
    end

    it "should return false if the number exist in the column otherwise return true" do
      mock = Sudoku.new("1-58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--")
      mock.board_array
      expect(mock.check_col?(5, 6)).to eq(false)
      expect(mock.check_col?(6, 1)).to eq(true)
    end
  end

  describe "check block?" do
    it "should accept three numbers as args" do
      mock = Sudoku.new("1-58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--")
      mock.board_array
      expect { mock.check_block?(5, 7, 9) }.to_not raise_error
    end

    it "should return false if the number exist in the block otherwise return true" do
      mock = Sudoku.new("1-58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--")
      mock.board_array
      expect(mock.check_block?(2, 3, 8)).to eq(false)
      expect(mock.check_block?(8, 7, 7)).to eq(true)
    end
  end

  describe "is number valid?" do
    it "should accept three numbers as args" do
      mock = Sudoku.new("1-58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--")
      mock.board_array
      expect { mock.is_number_valid?(5, 7, 9) }.to_not raise_error
    end

    it "should return false if the number exist at least in one of row or column or block otherwise return true" do
      mock = Sudoku.new("1-58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--")
      mock.board_array
      expect(mock.is_number_valid?(7, 2, 5)).to eq(false)
      expect(mock.is_number_valid?(1, 3, 1)).to eq(true)
    end
  end

  describe "fill_board" do
    it "should return the solved sudoku array" do
      mock = Sudoku.new("1-58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--")
      mock.board_array
      mock.find_empty_cells
      expect(mock.fill_board).to eq([[1, 4, 5, 8, 9, 2, 6, 7, 3],
                                     [8, 9, 3, 1, 7, 6, 4, 2, 5],
                                     [2, 7, 6, 4, 3, 5, 8, 1, 9],
                                     [5, 1, 9, 2, 4, 7, 3, 8, 6],
                                     [7, 6, 2, 5, 8, 3, 1, 9, 4],
                                     [3, 8, 4, 9, 6, 1, 7, 5, 2],
                                     [9, 5, 7, 6, 1, 4, 2, 3, 8],
                                     [4, 3, 8, 7, 2, 9, 5, 6, 1],
                                     [6, 2, 1, 3, 5, 8, 9, 4, 7]])
    end
  end

  describe "finished?" do
    it "should return true if the sudoku solved correctly otherwise return false" do
      mock = Sudoku.new("1-58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--")
      mock.solve
      expect(mock.finished?).to eq(true)
    end
    it "should return true if the sudoku solved correctly otherwise return false" do
      mock = Sudoku.new("1-58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--")
      expect(mock.finished?).to eq(false)
    end
  end
end
