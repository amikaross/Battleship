require './lib/cell'

class Board
attr_accessor :cells

  def initialize(height, width)
    @height = height
    @width = width
    numbers = (1..width).to_a.map { |number| number.to_s } 
    letters = (65..(height + 64)).to_a.map { |number| number.chr }
    keys = letters.each_with_object([]) { |letter, array| numbers.each { |number| array << letter + number } }
    @cells = Hash[keys.map { |key| [key, Cell.new(key)] }]
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
    coordinate_1[1..-1].to_i == coordinate_2[1..-1].to_i - 1
  end

  def consecutive_pair?(coordinate_pair)
    coordinate_1 = coordinate_pair[0]
    coordinate_2 = coordinate_pair[1]
    number_1 = coordinate_1[1..-1].to_i
    number_2 = coordinate_2[1..-1].to_i
    if coordinate_1[0] == coordinate_2[0] && consecutive_number?(coordinate_1, coordinate_2)
      true
    elsif number_1 == number_2 && consecutive_letter?(coordinate_1, coordinate_2)
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
    height = @height
    width = @width
    string = (1..width).each_with_object("  ") { |num, str| str << "#{num.to_s}  "}
    string << "\n" 
    (1..height).each do |row| 
      string << "#{(row + 64).chr} " 
      (1..width).each do |column|
        if ship_shows == false
          string << "#{@cells.values[(column + ((row - 1)*width))-1].render}  "
        else 
          string << "#{@cells.values[(column + ((row - 1)*width))-1].render(true)}  "
        end
      end
      string << "\n"
    end
    string
  end
end
