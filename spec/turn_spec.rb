require 'rspec'
require './lib/turn'

RSpec.describe Turn do
  before(:each) do
    @player_board = Board.new
    @computer_board = Board.new
    @computer_submarine = Ship.new("computer sub", 2)
    @computer_cruiser = Ship.new("computer cruiser", 3)
    @player_submarine = Ship.new("player sub", 2)
    @player_cruiser = Ship.new("player cruiser", 3)
    @player_board.place(@player_cruiser, ["A1", "A2", "A3"])
    @player_board.place(@player_submarine, ["B1", "B2"])
    @computer_board.place(@computer_cruiser, ["A1", "A2", "A3"])
    @computer_board.place(@computer_submarine, ["B1", "B2"])
    @turn = Turn.new(@player_board, @computer_board)
  end

  describe "#initialize" do
    it "exists" do
      expect(@turn).to be_an_instance_of(Turn)
    end

    it "has a readable player_board and computer_board" do
      expect(@turn.player_board).to eq(@player_board)
      expect(@turn.computer_board).to eq(@computer_board)
    end
  end

  describe "#player_fires" do
    it "should update fired_upon status of a cell object on the computer_board" do
      expect(@turn.computer_board.cells.values.all? { |cell| cell.fired_upon? == false }).to eq(true)
      @turn.player_fires("A1")
      expect(@turn.computer_board.cells["A1"].fired_upon?).to eq(true)
      @turn.player_fires("B4")
      expect(@turn.computer_board.cells["B4"].fired_upon?).to eq(true)
    end

    it "should return the updated computer_board object" do
      expect(@turn.player_fires("B2")).to eq(@turn.computer_board)
    end
  end

  describe "#computer_fires" do
    it "should update the cell object on the player's board with correct fired upon status" do
      expect(@turn.player_board.cells.values.all? { |cell| cell.fired_upon == false }).to eq(true)
      @turn.computer_fires("A1")
      expect(@turn.player_board.cells["A1"].fired_upon?).to eq(true)
      @turn.computer_fires("B3")
      expect(@turn.player_board.cells["A1"].fired_upon?).to eq(true)
    end

    it "should return the updated player_board object" do
      expect(@turn.computer_fires("A1")).to eq (@turn.player_board)
    end
  end

  describe "#random_shot" do
    it "returns a single valid coordinate" do
      shot = @turn.random_shot
      expect(@turn.player_board.valid_coordinate?(shot)).to eq(true)
    end

    it "only returns a coordinate that hasn't already been fired upon" do
      @turn.player_board.cells["A2"].fire_upon
      @turn.player_board.cells["A3"].fire_upon
      @turn.player_board.cells["A4"].fire_upon
      @turn.player_board.cells["B1"].fire_upon
      @turn.player_board.cells["B2"].fire_upon
      @turn.player_board.cells["B3"].fire_upon
      @turn.player_board.cells["B4"].fire_upon
      @turn.player_board.cells["C1"].fire_upon
      @turn.player_board.cells["C2"].fire_upon
      @turn.player_board.cells["C3"].fire_upon
      @turn.player_board.cells["C4"].fire_upon
      @turn.player_board.cells["D1"].fire_upon
      @turn.player_board.cells["D2"].fire_upon
      @turn.player_board.cells["A1"].fire_upon
      @turn.player_board.cells["D3"].fire_upon
      expect(@turn.random_shot).to eq("D4")
    end

    it "returns a different random coordinate every time called" do
      shot_1 = @turn.random_shot
      shot_2 = @turn.random_shot
      expect(shot_1 != shot_2)
    end
  end
end
