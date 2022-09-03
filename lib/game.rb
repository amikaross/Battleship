require ".lib/board"

class Game
  attr_reader

  def initialize
    @player_board = Board.new
    @computer_board = Board.new
    @player_cruiser = Ship.new("Player_cruiser", 3)
    @player_submarine = Ship.new("Player_submarine", 2)
    @computer_cruiser = Ship.new("Computer_cruiser", 3)
    @computer_submarine = Ship.new("Computer_submarine", 2)
  end

  def main_menu #AJP
    #It should print "Welcome to BATTLESHIP, etc (see greeting)"
    #Gets user input
    #Has response for "p", for "q" or for "other text"

    if user_input == "p"
      computer_board_setup
      player_board_setup
      play_game
    end
  end

  def computer_board_setup #AR

  end

  def player_board_setup #AJP
    #Take input, check through valid input, if so place ship if not new message
    #update the boards to place the ships (place is a board method)

  end

  def play_game #should be done
    until game_over?
      turn = Turn.new(@player_board, @computer_board)
      puts board_display
      @computer_board = turn.player_shot
      @player_board = turn.computer_shot
      puts turn.results
    end
    end_game
    main_menu
  end

  def end_game #done
    puts "#{winner} won!"
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

  def random_placement(board, ship) #AR

   #(supposed to give us coordinates)

  end

  def winner
    if computer_won?
      "I"
    else
      "You"
    end
  end

  def board_display #AJP
    #You have all of the little methods (board.render) that will help write the tests

  end
end
