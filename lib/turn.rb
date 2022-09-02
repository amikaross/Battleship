require './lib/board'

class Turn 
  attr_reader :player_board, 
              :computer_board

  def initialize(player_board, computer_board)
    @player_board = player_board
    @computer_board = computer_board 
  end

  def player_shot 
  end

  def computer_shot
  end

  def results
  end
end