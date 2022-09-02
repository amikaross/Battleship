require ".lib/board"

class Game
  attr_reader

  def initialize
    @player_board = Board.new
    @computer_board = Board.new
  end

  def main_menu
    #It should print "Welcome to BATTLESHIP, etc (see greeting)"
    #Gets user input
    #Has response for "p", for "q" or for "other text"

    if user_input == "p"
      computer_board_setup
      player_board_setup
      play_game
    end
  end

  def computer_board_setup
    #have to create ships
    comp_cruiser = Ship.new("Cruiser", 3)
    comp_submarine = Ship.new("Submarine", 2)
  end

  def player_board_setup
  end

  def play_game
    until game_over?
      turn = Turn.new(@player_board, @computer_board)
      puts display_boards
      @computer_board = turn.player_shot
      @player_board = turn.computer_shot
      # @player_board = turn.update_player_board
      # @computer_board = turn.update_computer_board
      puts turn.results
    end
    end_game
    main_menu
  end

  def end_game
    puts game.winner
  end

  def game_over?
  end

  def random_placement(board, ship)

   #(supposed to give us coordinates)

  end

  def winner

  end

  def board_display

  end
end
