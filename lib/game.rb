class Game
  attr_reader

  def initialize
    @player_board
    @computer_board

  end

  def main_menu
    #a bunch of stuff will happen
    if user_input == "p"
      computer_board_setup
      player_board_setup
      play_game
    end
  end

  def computer_board_setup
  end

  def player_board_setup
  end

  end

  def play_game
    until game_over?
      turn = Turn.new(@player_board, @computer_board)
      puts turn.display_boards
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
  end

  def game_over?
  end

  def random_placement
  end

  def winner
  end
