require './lib/cell'

class Board
attr_accessor :cells

  def initialize(board_coordinates)
    @cells = Hash[board_coordinates.map { |coordinate| [coordinate, Cell.new(coordinate)] }]
  end

  def valid_coordinate?(coordinate)
    @cells.keys.include?(coordinate)
  end

  def all_valid_coordinates?(coordinates)
    coordinates.all? { |coordinate| self.valid_coordinate?(coordinate) }
  end

  def consecutive_letter?(coordinate_1, coordinate_2)
    coordinate_1[0].ord == coordinate_2[0].ord - 1
  end

  def consecutive_number?(coordinate_1, coordinate_2)
    coordinate_1[1].ord == coordinate_2[1].ord - 1
  end

  def consecutive_pair?(coordinate_pair)
    coordinate_1 = coordinate_pair[0]
    coordinate_2 = coordinate_pair[1]
    if coordinate_1[0] == coordinate_2[0] && consecutive_number?(coordinate_1, coordinate_2)
      true
    elsif coordinate_1[1] == coordinate_2[1] && consecutive_letter?(coordinate_1, coordinate_2)
      true
    else
      false
    end
  end

  def all_consecutive?(coordinates)
    coordinates.each_cons(2) do |coordinate_pair|
      if consecutive_pair?(coordinate_pair) == false
        return false
      end
    end
    true
  end

  def all_empty?(coordinates)
    coordinates.all? { |coordinate| @cells[coordinate].empty? }
  end

  def valid_placement?(ship, coordinates)
    if ship.length != coordinates.length || all_valid_coordinates?(coordinates) == false
      false
    elsif all_empty?(coordinates) == false
      false
    elsif all_consecutive?(coordinates) == false && all_consecutive?(coordinates.reverse) == false
      false
    else
      true
    end
  end

  def place(ship, coordinates)
    coordinates.each do |coordinate|
      @cells[coordinate].place_ship(ship)
    end
  end

  def render(ship_shows = false)
    height = 
    if ship_shows == false
      
    else
      "  1 2 3 4 \n" +
      "A #{@cells["A1"].render(true)} #{@cells["A2"].render(true)} #{@cells["A3"].render(true)} #{@cells["A4"].render(true)} \n" +
      "B #{@cells["B1"].render(true)} #{@cells["B2"].render(true)} #{@cells["B3"].render(true)} #{@cells["B4"].render(true)} \n" +
      "C #{@cells["C1"].render(true)} #{@cells["C2"].render(true)} #{@cells["C3"].render(true)} #{@cells["C4"].render(true)} \n" +
      "D #{@cells["D1"].render(true)} #{@cells["D2"].render(true)} #{@cells["D3"].render(true)} #{@cells["D4"].render(true)} \n"
    end
  end
end
