require './lib/ship'

class Cell
  attr_reader :coordinate, :ship

  def initialize(coordinate)
    @ship = nil
    @coordinate = coordinate
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
  end

  # def fired_upon?
  #   if self.fire_upon
  #     true
  #   else
  #     false
  #   end
  # end

end
