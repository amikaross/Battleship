require "./lib/board"

class Turn
  attr_reader :player_board,
              :computer_board

  def initialize(player_board, computer_board)
    @player_board = player_board
    @computer_board = computer_board
    @player_shot = player_shot
    @computer_shot = computer_shot
  end

  def player_shot(coordinate)

  end

  def computer_shot(coordinate)
    # will have to come up with random coordinate
  end

  def results
    ##string containing interpolation for shot coordinates
  end
end
