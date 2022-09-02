require "./lib/ship"

class Cell
  attr_reader :coordinate, :ship, :fired_upon

  def initialize(coordinate)
    @ship = nil
    @coordinate = coordinate
    @fired_upon = false
    @render = "."
  end

  def empty?
    if @ship == nil
      true
    else
      false
    end
  end

  def place_ship(ship)
    @ship = ship
  end

  def fire_upon
    @fired_upon = true
    if @ship != nil
      @ship.health -= 1
    end
  end

  def fired_upon?
    if @fired_upon
      true
    else
      false
    end
  end

  def render(ship_shows = false)
    #consider using or in addition to and, at that point order will matter
    if fired_upon? == false && empty? == false
      if ship_shows == true
        "S"
      else
        "."
      end
    elsif fired_upon? == false && empty? == true
      "."
    elsif fired_upon? == true && empty? == false && @ship.sunk? == true
      "X"
    elsif fired_upon? == true && empty? == true
      "M"
    elsif fired_upon? == true && empty? == false
      "H"
    end
  end
end
