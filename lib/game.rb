require "./lib/board"
require "./lib/turn"

class Game
  attr_reader :player_board,
              :computer_board,
              :player_cruiser,
              :player_submarine,
              :computer_cruiser,
              :computer_submarine

  def initialize
    @player_board = Board.new
    @computer_board = Board.new
    @player_cruiser = Ship.new("Player_cruiser", 3)
    @player_submarine = Ship.new("Player_submarine", 2)
    @computer_cruiser = Ship.new("Computer_cruiser", 3)
    @computer_submarine = Ship.new("Computer_submarine", 2)
  end

  def computer_board_setup #AR
    cruiser_placement = random_placement(@computer_board, @computer_cruiser)
    @computer_board.place(@computer_cruiser, cruiser_placement)
    sub_placement = random_placement(@computer_board, @computer_submarine)
    @computer_board.place(@computer_submarine, sub_placement)
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

  def random_placement(board, ship)
    randomly_rotated_cells = unoccupied_cells(board).rotate(rand(unoccupied_cells(board).length))
    randomly_rotated_cells.each_cons(ship.length) do |coord_array|
      if board.valid_placement?(ship, coord_array)
        return coord_array
      end
    end
  end

  def unoccupied_cells(board)
    unoccupied_cells = []
    board.cells.each do |coord, cell_object|
      if cell_object.empty?  
        unoccupied_cells << coord 
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

  def board_display #AJP
    #You have all of the little methods (board.render) that will help write the tests

  end
end
