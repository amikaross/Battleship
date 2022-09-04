require "./lib/board"

class Turn
  attr_reader :player_board,
              :computer_board,
              :player_shot,
              :computer_shot

  def initialize(player_board, computer_board)
    @player_board = player_board
    @computer_board = computer_board
    @player_shot = nil
    @computer_shot = nil
  end

  def player_fires(player_shot)
    @computer_board.cells[player_shot].fire_upon 
    @computer_board
  end

  def computer_fires(random_shot)
    @player_board.cells[random_shot].fire_upon
    @player_board
  end

  def get_player_shot
    print "Enter the coordinate for your shot:\n" +
          "> "
    @player_shot = gets.chomp.upcase 
    if @computer_board.valid_coordinate?(@player_shot) == false
      until @computer_board.valid_coordinate?(@player_shot) == true
        print "Please enter a valid coordinate:\n" +
              "> "
        @player_shot = gets.chomp.upcase
      end
    end 
    if @computer_board.cells[@player_shot].fired_upon?
      until @computer_board.cells[@player_shot].fired_upon? == false
        print "You've already fired on that coordinate, please choose another:\n" +
              "> "
        @player_shot = gets.chomp.upcase
      end 
    end      
  end

  def random_shot
    unhit_cells = []
    @player_board.cells.each do |coord, cell_object|
      if cell_object.fired_upon? == false 
        unhit_cells << coord 
      end
    end
    @computer_shot = unhit_cells.sample 
  end

  def results
    "Your shot on #{@player_shot} was a #{player_shot_status}\n" +
    "My shot on #{@computer_shot} was a #{computer_shot_status}\n"
  end

  def player_shot_status
    hit_cell = @computer_board.cells[@player_shot]
    if hit_cell.empty?
      "miss."
    elsif hit_cell.empty? == false && hit_cell.ship.sunk?
      "hit and has sunk my #{hit_cell.ship.name}!"
    else 
      "hit!"
    end
  end

  def computer_shot_status
    hit_cell = @player_board.cells[@computer_shot]
    if hit_cell.empty?
      "miss."
    elsif hit_cell.empty? == false && hit_cell.ship.sunk?
      "hit and has sunk your #{hit_cell.ship.name}!"
    else 
      "hit!"
    end
  end
end
