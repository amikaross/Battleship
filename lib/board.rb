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
    if ship_shows == false
      "  1 2 3 4 \n" +
      "A #{@cells["A1"].render} #{@cells["A2"].render} #{@cells["A3"].render} #{@cells["A4"].render} \n" +
      "B #{@cells["B1"].render} #{@cells["B2"].render} #{@cells["B3"].render} #{@cells["B4"].render} \n" +
      "C #{@cells["C1"].render} #{@cells["C2"].render} #{@cells["C3"].render} #{@cells["C4"].render} \n" +
      "D #{@cells["D1"].render} #{@cells["D2"].render} #{@cells["D3"].render} #{@cells["D4"].render} \n"
    else
      "  1 2 3 4 \n" +
      "A #{@cells["A1"].render(true)} #{@cells["A2"].render(true)} #{@cells["A3"].render(true)} #{@cells["A4"].render(true)} \n" +
      "B #{@cells["B1"].render(true)} #{@cells["B2"].render(true)} #{@cells["B3"].render(true)} #{@cells["B4"].render(true)} \n" +
      "C #{@cells["C1"].render(true)} #{@cells["C2"].render(true)} #{@cells["C3"].render(true)} #{@cells["C4"].render(true)} \n" +
      "D #{@cells["D1"].render(true)} #{@cells["D2"].render(true)} #{@cells["D3"].render(true)} #{@cells["D4"].render(true)} \n"
    end
  end
end
