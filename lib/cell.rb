require './lib/ship'

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

  def place_ship(ship_type)
    @ship = ship_type
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

  def render
    if @fired_upon == false && @ship == nil
      "."
    elsif @fired_upon == false && @ship != nil
      "."
    elsif @fired_upon == true && @ship != nil && @ship.sunk? == true
      "X"
    elsif @fired_upon == true && @ship == nil
      "M"
    elsif @fired_upon == true && @ship != nil
      "H"
    end
  end

end
