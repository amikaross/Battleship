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

  describe "#player_shot" do
    it "Should update fired_upon status of a cell object on the computer_board" do
      expect(@turn.computer_board.cells.values.all? { |cell| cell.fired_upon? == false}).to be(true)
      @turn.player_shot("A1")
      expect(@turn.computer_board.cells["A1"].fired_upon?).to eq(true)
    end
  end

  describe "#computer_shot" do
    it "Should update the cell object on the player's board with correct fired upon status" do

    end
  end

  # describe "#results" do
  #   it "" do
  #     #terminal output, may not be able to test
  #   end
  # end
end
