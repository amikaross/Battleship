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
      game = Game.new(get_board_width, get_board_height)
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
    response = gets.chomp.strip.downcase
    until response == "y" || response == "n"
      print "I don't understand, please try again.\n" + 
            "> "
      response = gets.chomp.strip.downcase
    end
    if response == "n"
      print "Sorry to see you go, enjoy your day!"
    else
      display
    end
  end

  def get_board_width
    print "\n" +
          "Please input the board width (whole number, 4 or greater):\n" +
           "> "
    width = gets.chomp.strip.to_i 
    until width >= 4 
      print "That is an invalid input, please try again:\n" +
            "> "
      width = gets.chomp.strip.to_i 
    end
    width
  end 

  def get_board_height
    print "\n Thank you. Please input the board height (whole number, 4 or greater):\n" +
          "> "
    height = gets.chomp.strip.to_i 
    until height >= 4 
      print "That is an invalid input, please try again:\n" +
            "> "
      height = gets.chomp.strip.to_i 
    end 
    height
  end
end
