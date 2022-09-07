require 'rspec'
require './lib/board'


RSpec.describe Board do
  before(:each) do
    @board = Board.new(4, 4)
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  describe "#initialize" do
    it "is an instance of Board" do
      expect(@board).to be_an_instance_of(Board)
    end

    it "the cells attribute is a hash" do
      expect(@board.cells).to be_a(Hash)
    end

    it "the cells attribute has a number of key/value pairs to match arguments" do
      expect(@board.cells.count).to eq(16)
      board2 = Board.new(2, 3)
      expect(board2.cells.count).to eq(6)
      board3 = Board.new(6, 6)
      expect(board3.cells.count).to eq(36)
    end

    it "the cells attribute keys point to Cell objects" do
      values = @board.cells.values
      values.each do |value|
        expect(value).to be_a(Cell)
      end
    end
  end

  describe "#valid_coordinate?" do
    it "returns true/false depending on whether arg is a valid coordinate on the board" do
      expect(@board.valid_coordinate?("A1")).to eq(true)
      expect(@board.valid_coordinate?("D4")).to eq(true)
      expect(@board.valid_coordinate?("A5")).to eq(false)
      expect(@board.valid_coordinate?("E1")).to eq(false)
      expect(@board.valid_coordinate?("A22")).to eq(false)
    end
  end

  describe "#all_valid_coordinates?" do
    it "returns correct boolean value" do
      expect(@board.all_valid_coordinates?(["A1", "A2", "A3"])).to eq(true)
      expect(@board.all_valid_coordinates?(["A1", "A2", "E1"])).to eq(false)
    end
  end

  describe "#consecutive_letter?" do
    it "returns correct boolean value" do
      expect(@board.consecutive_letter?("A1", "B1")).to eq(true)
      expect(@board.consecutive_letter?("A1", "A2")).to eq(false)
      board2 = Board.new(6, 12)
      expect(board2.consecutive_letter?("A10", "B11")).to eq(true)
    end
  end

  describe "#consecutive_number?" do
    it "returns the correct boolean value" do
      expect(@board.consecutive_number?("A1", "A2")).to eq(true)
      expect(@board.consecutive_number?("A1", "B1")).to eq(false)
      board2 = Board.new(6, 12)
      expect(board2.consecutive_number?("A10", "A11")).to eq(true)
    end
  end

  describe "#consecutive_pair?" do
    it "returns the correct boolean value" do
      expect(@board.consecutive_pair?(["A1", "A2"])).to eq(true)
      expect(@board.consecutive_pair?(["A1", "B2"])).to eq(false)
      expect(@board.consecutive_pair?(["B2", "B4"])).to eq(false)
      expect(@board.consecutive_pair?(["C3", "D4"])).to eq(false)
      board2 = Board.new(6, 12)
      expect(board2.consecutive_pair?(["A10", "A11"])).to eq(true)
    end
  end

  describe "#all_consecutive?" do
    it "should return true for consecutive/non-diagonal cells only" do
      expect(@board.all_consecutive?(["A1", "A2", "A3"])).to eq(true)
      expect(@board.all_consecutive?(["A1", "A2", "A4"])).to eq(false)
      expect(@board.all_consecutive?(["A1", "B2", "B3"])).to eq(false)
      board2 = Board.new(6, 12)
      expect(board2.all_consecutive?(["A10", "A11", "A12"])).to eq(true)
    end
  end

  describe "#all_empty?" do 
    it "should return false if any of the cells at the given coordinates are occupied" do 
      @board.place(@cruiser, ["A1", "A2", "A3"])
      expect(@board.all_empty?(["A4", "B4", "C4"])).to eq(true)
      expect(@board.all_empty?(["A2", "A3", "A4"])).to eq(false)
    end
  end

  describe "#valid_placement?" do
    it "takes two arguments, the ship object and array of coordinates" do
      expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A3"])).to eq(true)
    end

    it "it does not allow for repeated cells as coordinates" do
      expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A1"])).to eq(false)
    end

    it "requires ship length to equal coordinates length" do
      expect(@cruiser.length).to eq(3)
      expect(@board.valid_placement?(@cruiser, ["A1", "A2"])).to eq(false)
      expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A3"])).to eq(true)
    end

    it "the coordinates are consecutive" do
      expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A3"])).to eq(true)
      expect(@board.valid_placement?(@cruiser, ["A1", "B1", "C1"])).to eq(true)
      expect(@board.valid_placement?(@cruiser, ["C1", "B1", "A1"])).to eq(true)
      expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A4"])).to eq(false)
      expect(@board.valid_placement?(@cruiser, ["A1", "B1", "D1"])).to eq(false)
    end

    it "allows for reverse coordinates" do
      expect(@board.valid_placement?(@cruiser, ["A3", "A2", "A1"])).to eq(true)
    end
 
    it "the coordinates can't be diagonal" do
      expect(@board.valid_placement?(@cruiser, ["B2", "C3", "D4"])).to eq(false)
      expect(@board.valid_placement?(@cruiser, ["A1", "B2", "C3"])).to eq(false)
    end

    it "the coordinates can't overlap that of another ship" do
      @board.place(@cruiser, ["A1", "A2", "A3"])
      expect(@board.valid_placement?(@submarine, ["B1", "B2"])).to eq(true)
      expect(@board.valid_placement?(@submarine, ["A1", "B1"])).to eq(false)
    end
  end

  describe "#place" do
    it "takes two arguments and updates the cell objects inside @cells" do
      expect(@board.cells["A1"].empty?).to eq(true)
      expect(@board.cells["A2"].empty?).to eq(true)
      expect(@board.cells["A3"].empty?).to eq(true)
      @board.place(@cruiser, ["A1", "A2", "A3"])
      expect(@board.cells["A1"].ship).to eq @cruiser
      expect(@board.cells["A2"].ship).to eq @cruiser
      expect(@board.cells["A3"].ship).to eq @cruiser
      expect(@board.cells["A1"].empty?).to eq(false)
      expect(@board.cells["A2"].empty?).to eq(false)
      expect(@board.cells["A3"].empty?).to eq(false)
    end
  end

  describe "#render" do
    it "renders empty board correctly" do
      expect(@board.render).to eq "  1  2  3  4  \n" + 
                                  "A .  .  .  .  \n" + 
                                  "B .  .  .  .  \n" + 
                                  "C .  .  .  .  \n" + 
                                  "D .  .  .  .  \n"
    end

    it "renders board with ship correctly depending on boolean argument" do
      @board.place(@cruiser, ["A1", "A2", "A3"])
      expect(@board.render).to eq "  1  2  3  4  \n" + 
                                  "A .  .  .  .  \n" + 
                                  "B .  .  .  .  \n" + 
                                  "C .  .  .  .  \n" + 
                                  "D .  .  .  .  \n"
      expect(@board.render(true)).to eq "  1  2  3  4  \n" + 
                                        "A S  S  S  .  \n" + 
                                        "B .  .  .  .  \n" + 
                                        "C .  .  .  .  \n" + 
                                        "D .  .  .  .  \n"
    end

    it "renders board with miss correctly" do
      @board.place(@cruiser, ["A1", "A2", "A3"])
      expect(@board.render).to eq "  1  2  3  4  \n" + 
                                  "A .  .  .  .  \n" + 
                                  "B .  .  .  .  \n" + 
                                  "C .  .  .  .  \n" + 
                                  "D .  .  .  .  \n"
      @board.cells["A4"].fire_upon
      expect(@board.render).to eq "  1  2  3  4  \n" + 
                                  "A .  .  .  M  \n" + 
                                  "B .  .  .  .  \n" + 
                                  "C .  .  .  .  \n" + 
                                  "D .  .  .  .  \n"
    end

    it "renders board with hit correctly" do
      @board.place(@cruiser, ["A1", "A2", "A3"])
      expect(@board.render).to eq "  1  2  3  4  \n" + 
                                  "A .  .  .  .  \n" + 
                                  "B .  .  .  .  \n" + 
                                  "C .  .  .  .  \n" + 
                                  "D .  .  .  .  \n"
      @board.cells["A3"].fire_upon
      expect(@board.render).to eq "  1  2  3  4  \n" + 
                                  "A .  .  H  .  \n" + 
                                  "B .  .  .  .  \n" + 
                                  "C .  .  .  .  \n" + 
                                  "D .  .  .  .  \n"
    end

    it "renders board with sunk ship correctly" do
      @board.place(@cruiser, ["A1", "A2", "A3"])
      expect(@board.render).to eq "  1  2  3  4  \n" + 
                                  "A .  .  .  .  \n" + 
                                  "B .  .  .  .  \n" + 
                                  "C .  .  .  .  \n" + 
                                  "D .  .  .  .  \n"
      @board.cells["A3"].fire_upon
      @board.cells["A2"].fire_upon
      expect(@board.render).to eq "  1  2  3  4  \n" + 
                                  "A .  H  H  .  \n" + 
                                  "B .  .  .  .  \n" + 
                                  "C .  .  .  .  \n" + 
                                  "D .  .  .  .  \n"
      @board.cells["A1"].fire_upon
      expect(@board.render).to eq "  1  2  3  4  \n" + 
                                  "A X  X  X  .  \n" + 
                                  "B .  .  .  .  \n" + 
                                  "C .  .  .  .  \n" + 
                                  "D .  .  .  .  \n"
    end
  end
end
