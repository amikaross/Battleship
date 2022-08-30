require './lib/ship'

class Cell
  attr_reader :coordinate, :ship, :fire_upon

  def initialize(coordinate)
    @ship = nil
    @coordinate = coordinate
    @fired_upon = false
  end

  def empty?
    if self.ship == nil
      true
    else
      false
    end
  end

  def place_ship(ship_type)
    @ship = ship_type
    self.ship
  end

  def fire_upon
    @ship.health -= 1
    @fired_upon = true
  end

  def fired_upon?
    if @fired_upon
      true
    else
      false
    end
  end

end
