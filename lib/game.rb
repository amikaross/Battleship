require "./lib/board"
require "./lib/turn"

class Game
  attr_reader :player_board,
              :computer_board,
              :player_cruiser,
              :player_submarine,
              :computer_cruiser,
              :computer_submarine

  def initialize(height, width)
    @player_board = Board.new(height, width)
    @computer_board = Board.new(height, width)
    @player_cruiser = Ship.new("cruiser", 3)
    @player_submarine = Ship.new("submarine", 2)
    @computer_cruiser = Ship.new("cruiser", 3)
    @computer_submarine = Ship.new("submarine", 2)
  end

  def computer_board_setup
    cruiser_placement = random_placement(@computer_board, @computer_cruiser)
    @computer_board.place(@computer_cruiser, cruiser_placement)
    sub_placement = random_placement(@computer_board, @computer_submarine)
    @computer_board.place(@computer_submarine, sub_placement)
  end

  def player_board_setup
    cruiser_placement = get_player_cruiser_coordinates
    @player_board.place(@player_cruiser, cruiser_placement)
    print "\n" +
          "#{@player_board.render(ship_shows = true)}"
    sub_placement = get_player_submarine_coordinates
    @player_board.place(@player_submarine, sub_placement)
  end

  def get_player_cruiser_coordinates
    print "\n" +
          "I have laid out my ships on the grid.\n"+
          "You now need to lay out your two ships.\n" +
          "The Cruiser is three units long and the Submarine is two units long.\n" +
          "#{@player_board.render(ship_shows = true)}" +
          "Enter the squares for the Cruiser (3 spaces, ex. A1 A2 A3):\n" +
          "> "
    coordinates = gets.chomp.strip.upcase.split
    until @player_board.valid_placement?(@player_cruiser, coordinates)
      print "Those are invalid coordinates. Please try again:\n" +
            "> "
      coordinates = gets.chomp.strip.upcase.split
    end
    coordinates
  end

  def get_player_submarine_coordinates
    print "Enter the squares for the Submarine (2 spaces, ex. B1 B2):\n" +
          "> "
    coordinates = gets.chomp.strip.upcase.split
    until @player_board.valid_placement?(@player_submarine, coordinates)
      print "Those are invalid coordinates. Please try again:\n" +
            "> "
      coordinates = gets.chomp.strip.upcase.split
    end
    coordinates
  end

  def play_game
    until game_over?
      turn = Turn.new(@player_board, @computer_board)
      print board_display
      player_shot = turn.get_player_shot
      computer_shot = turn.random_shot
      @computer_board = turn.player_fires(player_shot)
      @player_board = turn.computer_fires(computer_shot)
      print "\n" +
            "#{turn.results}"
    end
    end_game
  end

  def end_game
    print "#{board_display}" +
          "#{winner} won!\n"
  end

  def game_over?
    computer_won? || player_won?
  end

  def computer_won?
    @player_cruiser.sunk? && @player_submarine.sunk?
  end

  def player_won?
    @computer_cruiser.sunk? && @computer_submarine.sunk?
  end

  def random_placement(board, ship)
    randomly_rotated_cells = unoccupied_cells(board).rotate(rand(unoccupied_cells(board).length))
    randomly_rotated_cells.each_cons(ship.length) do |coordinates|
      if board.valid_placement?(ship, coordinates)
        return coordinates
      end
    end
  end

  def unoccupied_cells(board)
    unoccupied_cells = []
    board.cells.each do |coordinate, cell_object|
      if cell_object.empty?
        unoccupied_cells << coordinate
      end
    end
    unoccupied_cells
  end

  def winner
    if computer_won?
      "I"
    else
      "You"
    end
  end

  def board_display
          "\n" +
          "=============COMPUTER BOARD=============\n" +
          "#{@computer_board.render}" +
          "==============PlAYER BOARD==============\n" +
          "#{@player_board.render(true)}" +
          "\n"
  end
end
