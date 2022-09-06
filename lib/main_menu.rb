require "./lib/game"

class MainMenu

  def display
    print "\n" +
          "Welcome to BATTLESHIP\n" + 
          "...Enter p to play. Enter q to quit.\n" +
          "> "
    response = gets.chomp.strip.downcase
    until response == "p" || response == "q"
      print "I don't understand, please try again.\n" + 
            "> "
      response = gets.chomp.strip.downcase
    end
    if response == "q"
      print "Sorry BATTLESHIP is not your thing."
    else
      game = Game.new
      game.computer_board_setup
      game.player_board_setup
      game.play_game
      return_to_display
    end
  end

  def return_to_display
    print "\n" +
          "Would you like to return to the main menu?\n" +
          "Enter y for yes or n for no:\n" +
          "> "
    response = gets.chomp.downcase
    until response == "y" || response == "n"
      print "I don't understand, please try again.\n" + 
            "> "
      response = gets.chomp.downcase
    end
    if response == "n"
      print "Sorry to see you go, enjoy your day!"
    else
      display
    end
  end
end
