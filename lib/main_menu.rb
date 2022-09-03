class MainMenu

  def display #AJP
    print "Welcome to BATTLESHIP\n...Enter p to play. Enter q to quit.\n>"
    response = gets.chomp.downcase
    until response == "p" || response == "q"
      print "I don't understand, please try again.\n>"
      response = gets.chomp.downcase
    end
    if response == "q"
      print "Sorry BATTLESHIP is not your thing."
    else
      game = Game.new
      game.computer_board_setup
      game.player_board_setup
      game.play_game
      display
    end
  end
end
