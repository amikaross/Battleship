require "rspec"
require "./lib/game"

RSpec.describe Game do

  before(:each) do
    # @player_board = Board.new
    # @computer_board = Board.new
    @game = Game.new
  end

  describe "#initialize" do #AJP
    it "exists" do
      expect(@game).to be_an_instance_of(Game)
    end

    it "each game has a computer-board and a player_board" do #AJP
      expect(@game.player_board).to be_an_instance_of(Board)
      expect(@game.computer_board).to be_an_instance_of(Board)
    end

  end

  # describe "#main_menu" do
  #   # it "can accept user input" do #don't need to test for iteration 3
  #   # end
  #
  #   #my not be able to test, is all user input. Reassess later.
  # end

  describe "#play_game" do #AJP
    it "loop should continue until game is over" do
      expect(@game.game_over?).to eq(false)
      @game.play_game
      expect(@game.game_over?).to eq(true)
    end
  end

  describe "#player_board_setup" do #AJP
    it "should add 2 ships to the board" do
      expect(@player_board.cells.values.all? { |cell| cell.empty? }).to eq(true)
      @game.player_board_setup
      expect(@player_board.cells.values.all? { |cell| cell.empty? }).to eq(false)
      expect(@player_board.cells.values.count { |cell| cell.empty? == false }).to eq(5)
    end
  end

  describe "#computer_board_setup" do #AJP
    it "should add 2 ships to the board" do #AJP
      expect(@computer_board.cells.values.all? { |cell| cell.empty? }).to eq(true)
      @game.computer_board_setup
      expect(@computer_board.cells.values.all? { |cell| cell.empty? }).to eq(false)
      expect(@computer_board.cells.values.count { |cell| cell.empty? == false }).to eq(5)
    end

    # it "doesn't allow invalid ship placement" do #address later
    #   #expect that ()
    # end


  describe "#random_placement" do #AR
    it "should return and array of valid coordinates" do
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)
      coord_array = @game.random_placement(@bcomputer_board, cruiser)
      coord_array.each do |coord|
        expect(@computer_board.valid_coordinate(coord)).to eq(true)
      end
    end

    it "has the correct number of coordinates compared to ship length" do #AR
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)
      coord_array = @game.random_placement(@computer_board, cruiser)
      expect(coord_array.length).to eq cruiser.length
    end

    it "gives a valid placement" do #AR
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)
      coord_array = @game.random_placement(board, cruiser)
      expect(@computer_board.valid_placement?(cruiser, coord_array)).to eq(true)
      @computer_board.place(cruiser, coord_array)
      coord_array2 = @game.random_placement(@computer_board, submarine)
      expect(board.valid_placement?(submarine, coord_array2)).to eq(true)
    end
  end

  describe "#game_over?" do #AJP
    it "return true only if both ships belonging to 1 player are sunk" do
      expect(@game.game_over?).to eq(false)
      3.times { @game.player_cruiser.hit }
      expect(@game.player_cruiser.sunk?).to eq(true)
      expect(@game.game_over?).to eq(false)
      2.times { @game.player_submarine.hit }
      expect(@game.player_submarine.sunk?).to eq(true)
      expect(@game.game_over?).to eq(true)
    end
  end

  describe "#computer_won?" do #AR
    it "" do
    end

  end

  describe "#player_won?" do #AR
    it "" do
    end

  end

  describe "#winner" do #AR
    it "Will return the correct string ('You') if computer's ships have sunk" do
      comp_cruiser = Ship.new("Comp cruiser", 3)
      comp_sub = Ship.new("Comp sub", 2)
      player_cruiser = Ship.new("Player cruiser", 3)
      player_sub = Ship.new("Player sub", 2)
      @player_board.place(player_cruiser, [A1, A2, A3])
      @player_board.place(player_sub, [B1, B2])
      @computer_board.place(comp_cruiser, [A1, A2, A3])
      @computer_board.place(comp_sub, [B1, B2])
      @computer_board.cells["A1"].fire_upon
      @computer_board.cells["A2"].fire_upon
      @computer_board.cells["A3"].fire_upon
      @computer_board.cells["A4"].fire_upon
      @computer_board.cells["A5"].fire_upon
      expect(@game.winner).to eq("You")
    end

    it "Will return the correct string ('I') if player's ships have sunk" do #AR
      comp_cruiser = Ship.new("Comp cruiser", 3)
      comp_sub = Ship.new("Comp sub", 2)
      player_cruiser = Ship.new("Player cruiser", 3)
      player_sub = Ship.new("Player sub", 2)
      @player_board.place(player_cruiser, [A1, A2, A3])
      @player_board.place(player_sub, [B1, B2])
      @computer_board.place(comp_cruiser, [A1, A2, A3])
      @computer_board.place(comp_sub, [B1, B2])
      @player_board.cells["A1"].fire_upon
      @player_board.cells["A2"].fire_upon
      @player_board.cells["A3"].fire_upon
      @player_board.cells["A4"].fire_upon
      @player_board.cells["A5"].fire_upon
      expect(@game.winner).to eq("I")
    end
  end

  describe "#board_display" do #AR
    it "displays player ships but not computer ships" do
      comp_cruiser = Ship.new("Comp cruiser", 3)
      comp_sub = Ship.new("Comp sub", 2)
      player_cruiser = Ship.new("Player cruiser", 3)
      player_sub = Ship.new("Player sub", 2)
      @player_board.place(player_cruiser, [A1, A2, A3])
      @player_board.place(player_sub, [B1, B2])
      @computer_board.place(comp_cruiser, [A1, A2, A3])
      @computer_board.place(comp_sub, [B1, B2])
      expect(@game.board_display).to eq "=============COMPUTER BOARD=============\n" +
                                        "  1 2 3 4 \n" +
                                        "A . . . . \n" +
                                        "B . . . . \n" +
                                        "C . . . . \n" +
                                        "D . . . . \n" +
                                        "==============PlAYER BOARD==============\n" +
                                        "  1 2 3 4 \n" +
                                        "A S S S . \n" +
                                        "B S S . . \n" +
                                        "C . . . . \n" +
                                        "D . . . . \n"
    end
  end
end
