require './lib/cell'

class Board
attr_accessor :cells

  def initialize
    @cells = {
              "A1" => Cell.new("A1"),
              "A2" => Cell.new("A2"),
              "A3" => Cell.new("A3"),
              "A4" => Cell.new("A4"),
              "B1" => Cell.new("B1"),
              "B2" => Cell.new("B2"),
              "B3" => Cell.new("B3"),
              "B4" => Cell.new("B4"),
              "C1" => Cell.new("C1"),
              "C2" => Cell.new("C2"),
              "C3" => Cell.new("C3"),
              "C4" => Cell.new("C4"),
              "D1" => Cell.new("D1"),
              "D2" => Cell.new("D2"),
              "D3" => Cell.new("D3"),
              "D4" => Cell.new("D4")
              }
  end

  def valid_coordinate?(coord)
    @cells.keys.include?(coord)
  end

  def not_all_valid_coordinates?(coord_array)
    coord_array.all? { |coord| self.valid_coordinate?(coord)} == false
  end

  def consecutive_letter?(coord1, coord2)
    coord1[0].ord == coord2[0].ord + 1 || coord1[0].ord == coord2[0].ord - 1
  end

  def consecutive_number?(coord1, coord2)
    coord1[1].ord == coord2[1].ord + 1 || coord1[1].ord == coord2[1].ord - 1
  end

  def consecutive_cells?(coord_pair)
    coord1 = coord_pair[0]
    coord2 = coord_pair[1]
    if coord1[0] == coord2[0] && consecutive_number?(coord1, coord2)
      true
    elsif coord1[1] == coord2[1] && consecutive_letter?(coord1, coord2)
      true
    else
      false
    end
  end

  def all_consecutive?(coord_array)
    coord_array.each_cons(2) do |coord_pair|
      if consecutive_cells?(coord_pair) == false
        return false
      end
    end
    true
  end

  def ship_present?(coord_array)
    coord_array.each do |coord|
      if @cells[coord].ship != nil
        return true
      end
    end
    false
  end

  def valid_placement?(ship, coord_array)
    if ship.length != coord_array.length || not_all_valid_coordinates?(coord_array)
      false
    elsif all_consecutive?(coord_array) == false
      false
    elsif ship_present?(coord_array)
      false
    else
      true
    end
  end

  def place(ship, coord_array)
    #will just place the ship on the board, the valid_placement method will do the checking
    coord_array.each do |coord|
      @cells[coord].place_ship(ship)
    end
  end


end
