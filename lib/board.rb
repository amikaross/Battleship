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
    coord1[0].ord == coord2[0].ord - 1
  end

  def consecutive_number?(coord1, coord2)
    coord1[1].ord == coord2[1].ord - 1
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
    reverse = coord_array.reverse
    if consecutive_letter?(coord_array[0], coord_array[1]) || consecutive_number?(coord_array[0], coord_array[1])
      coord_array.each_cons(2) do |coord_pair|
        if consecutive_cells?(coord_pair) == false
          return false
        end
      end
      true
    elsif consecutive_letter?(reverse[0], reverse[1]) || consecutive_number?(reverse[0], reverse[1])
      reverse.each_cons(2) do |coord_pair|
        if consecutive_cells?(coord_pair) == false
          return false
        end
      end
      true
    else
      false
    end
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

  def render(ship_shows = false)
      #return value has to be a string and it has to have a certain number of spaces to keep the board in figure
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
