require "./lib/board"

class Turn
  attr_reader :player_board,
              :computer_board

  def initialize(player_board, computer_board)
    @player_board = player_board
    @computer_board = computer_board
  end

  def player_fires(player_shot)

  end

  def computer_fires(random_shot)
    # will have to come up with random coordinate
  end

  def get_player_shot
    
  end

  def random_shot
    
  end

  def results
    ##string containing interpolation for shot coordinates
  end
end
