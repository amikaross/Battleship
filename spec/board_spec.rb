require 'rspec'
require './lib/board'


RSpec.describe Board do
  before(:each) do
    @board = Board.new
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

    it "the cells attribute has 16 key/value pairs" do
      expect(@board.cells.length).to eq 16
    end

    it "the cells attribute keys point to Cell objects" do
      values = @board.cells.values
      values.each do |value|
        expect(value).to be_a(Cell)
      end
    end
  end

  describe "#valid_coordinate?" do
    xit "the argument 'A1' passed to the method valid_coordinate?" do
      expect(@board.valid_coordinate?("A1")).to eq(true)
      expect(@board.valid_coordinate?("E1")).to eq(false)
    #unsure how to write this test/if we really need it
    end

    xit "it is a valid coordinate on the board" do
    expect(@board.valid_coordinate?("A1")).to eq(true)
    expect(@board.valid_coordinate?("D4")).to eq(true)
    expect(@board.valid_coordinate?("A5")).to eq(false)
    expect(@board.valid_coordinate?("E1")).to eq(false)
    expect(@board.valid_coordinate?("A22")).to eq(false)
    end
  end

  describe "#valid_placement?" do
    xit "takes two arguments, the ship object and array of coordinate" do
      expect(@board.valid_placement.ship).to eq("Cruiser")
      expect(@board.valid_placement.coordinates).to eq(["A1", "A2", "A3"])
    end

    xit "has ship length equal to coordinates length" do
      expect(@cruiser.length).to eq(3)
      expect(@board.valid_placement.coordinates.length).to eq(3)
      expect(@board.valid_placement?(cruiser, ["A1", "A2"])).to eq(false)
      expect(@board.valid_placement?(cruiser, ["A1", "A2", "A3"])).to eq(true)
    end

    xit "the coordinates are consecutive" do
      expect(@board.valid_placement?(cruiser, ["A1", "A2", "A3"])).to eq(true)
      expect(@board.valid_placement?(cruiser, ["A1", "B1", "C1"])).to eq(true)
      expect(@board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to eq(false)
      expect(@board.valid_placement?(cruiser, ["A1", "B1", "D1"])).to eq(false)
    end

    xit "coordinates can't be in reverse consecutive order" do
      expect(@board.valid_placement?(cruiser, ["A1", "A2", "A3"])).to eq(true)
      expect(@board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to eq(false)
    end

    xit "the coordinates can't be diagonal" do
      expect(@board.valid_placement?(cruiser, ["A1", "A2", "A3"])).to eq(true)
      expect(@board.valid_placement?(cruiser, ["A1", "B2", "C3"])).to eq(false)
    end

    xit "the coordinates can't overlap that of another ship" do
      @ship.placement(cruiser, ["A1", "A2", "A3"])
      expect(@board.valid_placement?(submarine, ["B1", "B2"])).to eq(true)
      expect(@board.valid_placement?(submarine, ["A1", "B1"])).to eq(false)

    xit "If the previous checks pass, then the placement should be valid_placement" do
      @ship.placement(cruiser, ["B1", "C1", "D1"])
      @ship.placement(submarine,["A1", "A2"])
      expect(@board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to eq(true)
      expect(@board.valid_placement?(submarine, ["A1", "A2"])).to eq(true)
    end
  end

  describe "#place" do #AMR
    #takes two arguments - ship_type and an array of coordinates
    #It should update the @cells attribute to change the @ship attribute inside of the cell
  end #AMR

  describe "#render" do #AMR
    #Similar to cell but for whole board
    #Optional boolean argument
  end #AMR
end
