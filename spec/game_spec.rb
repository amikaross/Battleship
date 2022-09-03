require "rspec"
require "./lib/game"

RSpec.describe Game do

  before(:each) do
    @player_board = Board.new
    @computer_board = Board.new
    @game = Game.new(@player_board, @computer_board)
  end

  describe "#initialize" do
    it "exists" do
      expect(@game).to be_an_instance_of(Game)
    end

    it "each game has a computer-board and a player_board" do #AJP

    end

  end

  # describe "#main_menu" do
  #   # it "can accept user input" do #don't need to test for iteration 3
  #   # end
  #
  #   #my not be able to test, is all user input. Reassess later.
  # end

  describe "#play_game" do

    it "loop should continue until game is over" do #AJP
      #game_over? should be false
      #call @game.play_game
      #game_over? should be true
    end
  end

  describe "#player_board_setup" do
    it "should add 2 ships to the board" do #AJP
      # check that no cells are occupied (iterate through the hash of the
      # computer board to make sure they are empty)
      # game.computer_board_setup
      # check that 5 cells are occupied
    end
  end

  describe "#computer_board_setup" do
    it "should add 2 ships to the board" do #AJP
      # check that no cells are occupied (iterate through the hash of the
      # computer board to make sure they are empty)
      # game.computer_board_setup
      # check that 5 cells are occupied
    end

    # it "doesn't allow invalid ship placement" do #address later
    #   #expect that ()
    # end


  describe "#random_placement" do
    it "should return and array of valid coordinates" do
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)
      coord_array = @game.random_placement(@board, cruiser)
      coord_array.each do |coord|
        expect(@board.valid_coordinate(coord)).to eq(true)
      end
    end

    it "has the correct number of coordinates compared to ship length" do
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)
      coord_array = @game.random_placement(@board, cruiser)
      expect(coord_array.length).to eq cruiser.length
    end

    it "gives a valid placement" do
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)
      coord_array = @game.random_placement(board, cruiser)
      expect(@board.valid_placement?(cruiser, coord_array)).to eq(true)
      @board.place(cruiser, coord_array)
      coord_array2 = @game.random_placement(@board, submarine)
      expect(board.valid_placement?(submarine, coord_array2)).to eq(true)
    end
  end

  describe "#game_over?" do
    it "return true if both ships belonging to 1 player are sunk" do #AJP

    end

    it "return false if both ships belonging to 1 player are not sunk" do #AJP

    end
  end

  # describe "#end_game" do
  #   #May not be able to test this, is terminal output
  #   it "" do
  # 
  #   end
  # end

  describe "#winner" do
    it "Will return the correct winner (player whose ships are not sunk)" do #AR

    end
  end

  describe "#board_display" do
    it "player can see their ships and not see computer ships" do #AR

    end
  end

end
